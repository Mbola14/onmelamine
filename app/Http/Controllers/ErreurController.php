<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Http\Requests;

class ErreurController extends Controller
{
    public function init()
    {
        return view ('error', [
            'err' => ''
        ]);
    }
}
