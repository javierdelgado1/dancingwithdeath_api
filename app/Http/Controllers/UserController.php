<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Http\Controllers\ResponseController;
use Validator;
use Illuminate\Support\Facades\Log;
use Hash;
class UserController extends Controller
{

    private $response;
    public function __construct()
    {   
        $this->response = new ResponseController("User");
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        
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

    public function getUser(Request  $request){
        
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        
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
        
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        
    }

   

  

    public function signin (Request $request){
        $validator = Validator::make($request->all(), [
            'username' => 'required',
            'password' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json($this->response->response("error", "save",  $validator->errors()->all()));
        }

        $user= User::where('email', $request->username)->first();

        if(!$user){
            return response()->json($this->response->response("error", "show", "User not found") );
        }
         if(Hash::check($request->password, $user->password)){
            $http = new \GuzzleHttp\Client;
    
           $url = $_SERVER['SERVER_NAME'] == "dancingwithdeath.test"? env("APP_URL")."/oauth/token" : env("APP_URL_PRODUCTION")."/oauth/token";

            $response = $http->post($url, [
                'form_params' => [
                    "username"     => $request->username,
                    "password"      => $request->password,
                    "grant_type" => "password",
                    "client_id" => 2,
                    "client_secret" => "XiesXBwXY2xu9GAhI3b4gJl6lLhVGEV0UTttSpHf",
                    "scope" => ""
                ],
            ]);
            $response= [    
                    
                            'token' =>json_decode( (string) $response->getBody(), true),
                            'user' => $user
                        ];
            
            
            return response()->json($response,200);
        }
        else{
            return response()->json($this->response->response("error", "show", "Password Incorrect") );
        } 

        
        
    }
}
