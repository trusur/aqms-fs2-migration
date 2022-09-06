<?php

namespace App\Commands;

use App\Models\m_configuration;
use CodeIgniter\CLI\BaseCommand;
use CodeIgniter\CLI\CLI;
use App\Models\m_sensor_value;
use App\Models\m_measurement;
use App\Models\m_measurement_log;
use App\Models\m_measurement_history;
use App\Models\m_parameter;
use Exception;

class FormulaMeasurementLogs extends BaseCommand
{
	/**
	 * The Command's Group
	 *
	 * @var string
	 */
	protected $group = 'CodeIgniter';

	protected $parameters;
	protected $sensor_values;
	protected $measurement_logs;
	protected $measurement_histories;
	protected $configurations;
	protected $lastPutData;

	public function __construct()
	{
		$this->parameters =  new m_parameter();
		$this->sensor_values =  new m_sensor_value();
		$this->measurement_logs =  new m_measurement_log();
		$this->measurement_histories =  new m_measurement_history();
		$this->configurations =  new m_configuration();
		$this->measurements =  new m_measurement();
		$this->lastPutData = "0000-00-00 00:00";
	}

	/**
	 * The Command's Name
	 *
	 * @var string
	 */
	protected $name = 'command:formula_measurement_logs';

	/**
	 * The Command's Description
	 *
	 * @var string
	 */
	protected $description = '';

	/**
	 * The Command's Usage
	 *
	 * @var string
	 */
	protected $usage = 'command:name [arguments] [options]';

	/**
	 * The Command's Arguments
	 *
	 * @var array
	 */
	protected $arguments = [];

	/**
	 * The Command's Options
	 *
	 * @var array
	 */
	protected $options = [];

	/**
	 * Actually execute a command.
	 *
	 * @param array $params
	 */

	public function hexToFloat($strHex)
	{
		$v = hexdec($strHex);
		$x = ($v & ((1 << 23) - 1)) + (1 << 23) * ($v >> 31 | 1);
		$exp = ($v >> 23 & 0xFF) - 127;
		return $x * pow(2, $exp - 23);
	}

	public function run(array $params)
	{
		while (true) {
			$this->measurement_logs->where("(is_averaged = 1 AND xtimestamp < ('" . date("Y-m-d H:i:s") . "' - INTERVAL 2 HOUR))")->delete();
			// $this->measurement_histories->where("xtimestamp < ('" . date("Y-m-d H:i:s") . "' - INTERVAL 24 HOUR)")->delete();

			foreach ($this->sensor_values->findAll() as $sensor_value) {
				$sensor[$sensor_value->sensor_reader_id][$sensor_value->pin] = $sensor_value->value;
			}

			foreach ($this->parameters->where("is_view", 1)->findAll() as $parameter) {
				if ($parameter->formula != "") {
					@eval("\$data[$parameter->id] = $parameter->formula;");
					$sensor_check = @$sensor[@$sensor_value->sensor_reader_id * 1][@$sensor_value->pin * 1];
					$sensor_value = @$this->sensor_values->where("id", $parameter->sensor_value_id)->findAll()[0];
					if (strpos(" " . @$sensor[@$sensor_value->sensor_reader_id * 1][@$sensor_value->pin * 1], "FS2_MEMBRASENS") > 0) {
						try {
							$arr_sensor_value = explode('$sensor[' . $sensor_value->sensor_reader_id . '][' . $sensor_value->pin . '])[', $parameter->formula)[1];
							$arr_sensor_value = explode("])", $arr_sensor_value)[0];
							$sensor_value = explode(";", @$sensor[@$sensor_value->sensor_reader_id * 1][@$sensor_value->pin * 1])[$arr_sensor_value + 4];
						} catch (Exception $e) {
							$sensor_value = (float) @$sensor[@$sensor_value->sensor_reader_id * 1][@$sensor_value->pin * 1] * 1;
						}
					} elseif ((count(explode(",", $sensor_check)) == 7) && (count(explode(";", $sensor_check)) == 2)) {
						// Check PM AQMS FS1 Value
						$sensor_value = @eval("\$parameter->formula;");
					} else {
						$sensor_value = (float) @$sensor[@$sensor_value->sensor_reader_id * 1][@$sensor_value->pin * 1] * 1;
					}
				} else {
					$data[$parameter->id] = 0;
					$sensor_value = 0;
				}
				$measurement_logs = [
					"parameter_id" => $parameter->id,
					"value" => ($data[$parameter->id] < 0) ? 0 : $data[$parameter->id],
					"sensor_value" => $sensor_value,
					"is_averaged" => 0
				];
				$this->measurement_logs->save($measurement_logs);
				// $this->measurement_histories->save($measurement_logs);
			}
			sleep(1);
		}
	}
}
