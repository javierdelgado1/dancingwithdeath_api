<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ResponseController extends Controller
{
    private $table;
    public function __construct($table){
        $this->table=$table;
    }
    public function setTable($value){
        $this->table=$value;
    }
    public function response($type, $action, $object)
    {
        if ($type == "success" && $action == "save") {
            $response['status'] = "success";
            $response['message'] = "It has been successfully saved";
            $response[$this->table] = $object;
            return $response;
        }
        if ($type == "error" && $action == "save") {
            $response['status'] = "error";
            $response['message'] = $object;
            return $response;
        }
        if ($type == "exits" && $action == "save") {
            $response['status'] = "error";
            $response['message'] = "An equal record already exists";
            return $response;
        }
        if ($type == "success" && $action == "updated") {
            $response['status'] = "success";
            $response['message'] = "It has been successfully updated";
            $response[$this->table] = $object;
            return $response;
        }


        if ($type == "success" && $action == "show") {
            $response['status'] = "success";
            $response[$this->table] = $object;
            return $response;
        }
        if ($type == "error" && $action == "show") {
            $response['status'] = "error";
            $response['message'] = $object;
            return $response;
        }

        if ($type == "success" && $action == "delete") {
            $response['status'] = "success";
            $response['message'] = "It has been successfully deleted";
            return $response;

        }
        if ($type == "busy" && $action == "delete") {
            $response['status'] = "error";
            $response['message'] = "Can not be deleted because it is used";
            return $response;

        }


        if($type == "success" && $action == "index"){
            $response['status'] = "success";
            $response[$this->table] = $object;
            return $response;
        }
    }
}

