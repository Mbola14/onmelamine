<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Http\Requests;

class AccessoiresController extends Controller
{
    public function init()
    {
        $select = DB::select("SELECT * FROM accessoire
        ");
        return view ('accessoires', [
            'accessoires' => $select
        ]);
    }

    public function ajoutAccessoire(Request $request)
    {
        $nom_accessoire = $request->input('nom_accessoire');
        $unite = $request->input('unite');

        DB::insert("insert into accessoire (accessoire, unite) values ('".$nom_accessoire."', '".$unite."')");

        return redirect()->route('liste_clients');
    }

    public function stockFinalTotal($id_accessoire){
        $select = DB::select("select * from v_mvt where id_accessoire = ".$id_accessoire);
        $reste = 0;
        for($i = 0; $i<count($select); $i++){
            $reste += $select[$i]->stock_final;
        }
        return view ('stock', [
            'stock_final' => $select,
            'reste' => $reste
        ]);
    }

}
