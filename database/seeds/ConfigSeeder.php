<?php

use Illuminate\Database\Seeder;

class ConfigSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('oauth_clients')
        ->where('id', 2)
        ->update(['secret' => 'XiesXBwXY2xu9GAhI3b4gJl6lLhVGEV0UTttSpHf']);
    }
}
