<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use App\User;

class Booking extends Model
{
    protected $table = 'booking';
    protected $fillable = [
        'id', 'date', 'available_hours_id',  'user_id', 'contact_email', 'created_at', 'updated_at'
    ];
    public $timestamps = true;

    public function getAvailableHoursIdAttribute($value)
    {
        return  DB::table('available_hours')->where('id', $value)->first();
    }

    public function getUserIdAttribute($value)
    {
        return  User::find($value);
    }
}
