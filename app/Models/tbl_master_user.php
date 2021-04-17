<?php

namespace App\Models;

use App\Models\tbl_master_user_role;
use Illuminate\Database\Eloquent\Model;

class tbl_master_user extends Model
{
    protected $table = 'tbl_master_user';

    public function getRole(){
        return $this->hasOne(tbl_master_user_role::class, 'id', 'role_id');
    }
}
