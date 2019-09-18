<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Booking;
use App\Http\Controllers\ResponseController;
use Validator;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class BookingController extends Controller
{
    private $response;

    public function __construct()
    {
        $this->response = new ResponseController("Booking");
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Booking::get();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'date' => 'required',
            'hour_id' => 'required|integer',
            'email' => 'required',
        ]);
        if($validator->fails()) {
            return response()->json($this->response->response("error", "save",  $validator->errors()->all()),500);
        }
        $booking = Booking::where('date', $request->date)->where('available_hours_id', $request->hour_id)->first();
        $is_valid_date = Carbon::parse($request->date); 
        if(!$is_valid_date->isWeekday())
            return response()->json($this->response->response("error", "show", "Invalid date, death only dances on weekdays"), 200);

        if(!$booking)
        {
            $booking =new Booking;
            $booking->contact_email = $request->email;
            $booking->date = $request->date;
            $booking->available_hours_id= $request->hour_id;
            $booking->user_id =$request->user()->id;
            $booking->save();

            return response()->json($this->response->response("success", "save",   $booking),200);
            
        }

        return response()->json($this->response->response("exits", "save",   $booking),200);


    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $booking = Booking::where('id', $id)->first();
        if (!$booking) {
            return response()->json($this->response->response("error", "show", "Booking not found"), 404);
        }
        return response()->json($this->response->response("success", "show", $booking), 200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $booking = Booking::where('id', $id)->first();

        if (!$booking) {
            return response()->json($this->response->response("error", "show", "Booking not found"), 404 );
        }
            
        $validator = Validator::make($request->all(), [
            'date' => 'required',
            'hour_id' => 'required|integer',
            'email' => 'required',

        ]);
        if($validator->fails()) {
            return response()->json($this->response->response("error", "save",  $validator->errors()->all()),500);
        }
        $is_valid_date = Carbon::parse($request->date); 
        if(!$is_valid_date->isWeekday())
            return response()->json($this->response->response("error", "show", "Invalid date, death only dances on weekdays"), 200);
            
        $booking_exits = Booking::where('date', $request->date)->where('available_hours_id', $request->hour_id)->first();
        if(!$booking_exits)
        {
            $booking->date = $request->date;
            $booking->contact_email = $request->email;
            $booking->available_hours_id= $request->hour_id;
            $booking->user_id =$request->user()->id;
            $booking->save();
            return response()->json($this->response->response("success", "updated",   $booking),200);
        }
        return response()->json($this->response->response("exits", "save",   $booking),200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $booking = Booking::find($id);
        if ( ! $booking ) {
            return response()->json($this->response->response("error", "show", "Booking not found"),404 );
        }
        else{
            $result = $booking->delete();
            return response()->json($this->response->response("success", "delete", $result), 200);
        }
    }


    public function getHoursAvailable(){
        $hours = DB::table('available_hours')->where('is_available', 1)->get();
        return response()->json($this->response->response("success", "show", $hours), 200);
    }
}
