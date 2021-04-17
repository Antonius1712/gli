<?php

namespace App\Http\Controllers;

use App\Models\tbl_master_user_role;
use Illuminate\Http\Request;

class UserRoleController extends Controller
{
    public function index(Request $request){

        $length = $request->length;
        $searchValue = $request->searchValue;
        $sortBy = $request->sortBy;
        $column = $request->column;

        $query = tbl_master_user_role::orderBy($column, $sortBy);

        if( $searchValue ){
            $query->where(function($q) use ($searchValue) {
                $q->where('name', 'like', '%' . $searchValue . '%');
            });
        }

        $data = $query->paginate($length);

        return $data;
    }

    public function store(Request $request){
        $user = new tbl_master_user_role;
        $user->name = $request->name;
        $user->save();

        return 'Success';
    }

    public function update(Request $request){
        $user = tbl_master_user_role::where('id',$request->id)->first();
        $user->name = $request->name;
        $user->save();

        return 'Success';
    }

    public function destroy(Request $request){
        tbl_master_user_role::where('id',$request->id)->delete();
        return 'Success';
    }

    public function listRole(){
        return tbl_master_user_role::all();
    }
}
