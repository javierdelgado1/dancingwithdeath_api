<?php

use Illuminate\Database\Seeder;
use App\User;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $password="secret";
        $this->add("John" , "Due", "johndue@gmail.com");
        $this->add("User 1" , "Perez", "user1@gmail.com");
        $this->add("User 2" , "Aleman", "user2@gmail.com");
        $this->add("User 3" , "Diaz", "user3@gmail.com");
    }

    public function add($name, $lastname, $email, $password="secret") {
    	$model = new User;
        $model->name = ucfirst(strtolower($name));
        $model->last_name = ucfirst(strtolower($name));
        $model->email = $email;
        $model->password = bcrypt($password);
        $model->save();
    }
}
