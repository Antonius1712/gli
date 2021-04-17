<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class createRole extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        DB::table('tbl_master_user_role')->insert([
            'name' => 'Super Admin',
        ]);

        DB::table('tbl_master_user_role')->insert([
            'name' => 'Admin',
        ]);

        DB::table('tbl_master_user_role')->insert([
            'name' => 'User',
        ]);
    }
}
