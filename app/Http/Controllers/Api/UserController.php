<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Models\tbl_master_user;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function index(Request $request){

        $length = $request->length;
        $searchValue = $request->searchValue;
        $sortBy = $request->sortBy;
        $column = $request->column;

        $query = tbl_master_user::orderby($column, $sortBy);
        

        if( $searchValue ){
            $query->whereHas('getRole', function($sq) use ($searchValue){
                $sq->where('name', 'like', '%' . $searchValue . '%');
            })->orWhere(function($q) use ($searchValue) {
                $q->where('username', 'like', '%' . $searchValue . '%')
                    ->orWhere('email', 'like', '%' . $searchValue . '%');
            })->with('getRole');
        }else{
            $query->with('getRole');
        }

        $data = $query->paginate($length);

        return $data;
    }

    public function store(Request $request){
        $user = new tbl_master_user;
        $user->username = $request->username;
        $user->email = $request->email;
        $user->password = Hash::make($request->password);
        $user->role_id = $request->role;
        $user->save();

        return 'Success';
    }

    public function update(Request $request){
        $user = tbl_master_user::where('id',$request->id)->first();
        $user->username = $request->username;
        $user->email = $request->email;
        $user->password = Hash::make($request->password);
        $user->role_id = $request->role;
        $user->save();

        return 'Success';
    }

    public function destroy(Request $request){
        tbl_master_user::where('id',$request->id)->delete();
        return 'Success';
    }
}
