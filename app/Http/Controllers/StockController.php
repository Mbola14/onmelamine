<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Http\Requests;

class StockController extends Controller
{
    public function init()
    {
        $select = DB::select("SELECT * FROM v_stock ORDER BY id_accessoire");
        return view ('stockGlobal', [
            'stocks' => $select
        ]);
    }

    public function ajoutStock(Request $request)
    {
        $id_accessoire = $request->input('id_accessoire');
        $stock = $request->input('stock');

        $select = DB::select("SELECT * FROM stock WHERE id_accessoire = ".$id_accessoire);
        $ancien = $select[0]->stock;
        $nouveau = $ancien + $stock;

        DB::insert("UPDATE stock SET stock = ".$nouveau." WHERE id_accessoire = ".$id_accessoire);

        return redirect()->route('list_stock');
    }



}
