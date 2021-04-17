<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CreateUsers extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('tbl_master_user')->insert([
            'role_id' => 1,
            'username' => 'Antonius Christian',
            'password' => Hash::make('Iceblast1'),
            'email' => 'Antonius1712@gmamil.com',
        ]);
    }
}
