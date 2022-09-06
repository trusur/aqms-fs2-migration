<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class InsertConfiguration20220413 extends Migration
{
	public function up()
	{
		$data = [
			['name' => 'is_cems', 'content' => '0'],
		];
		$this->db->table('configurations')->insertBatch($data);
	}

	public function down()
	{
		$this->db->table('configurations')->where(["name" => "is_cems"])->delete();
	}
}
