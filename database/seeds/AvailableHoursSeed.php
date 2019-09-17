<?php

use Illuminate\Database\Seeder;

class AvailableHoursSeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->add("09:00", 1);
        $this->add("10:00", 1);
        $this->add("11:00", 1);
        $this->add("12:00", 1);
        $this->add("13:00", 1);
        $this->add("14:00", 1);
        $this->add("15:00", 1);
        $this->add("16:00", 1);
        $this->add("17:00", 1);
        $this->add("18:00", 1);
    }


    public function add($hour, $is_available){
        DB::table('available_hours')->insert(
            [
                'hour' => $hour,
                'is_available' => $is_available,
            ]
        );

    }
}
