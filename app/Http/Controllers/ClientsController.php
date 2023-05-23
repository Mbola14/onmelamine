<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Http\Requests;

class ClientsController extends Controller
{
    public function init()
    {
        $select = DB::select("SELECT client.id_client, nom, prenom, numero, nom_civilite FROM client 
            JOIN numero_telephone ON client.id_client = numero_telephone.id_client
            JOIN civilite c ON c.id_civilite = client.id_civilite
        ");
        return view ('clients', [
            'clients' => $select
        ]);
    }

    public function ajoutClient(Request $request)
    {
        $nom = $request->input('nom');
        $prenom = $request->input('prenom');
        $num = $request->input('tel');
        $id_civ = $request->input('civilite');

        $select = DB::select("SELECT client.id_client, nom, prenom, numero, nom_civilite FROM client 
            JOIN numero_telephone ON client.id_client = numero_telephone.id_client
            JOIN civilite c ON c.id_civilite = client.id_civilite 
            ORDER BY client.id_client DESC LIMIT 1
        ");

        if($select[0 != null])
        {
            $id_client = $select[0]->id_client+1;
        }
        else{$id_client = 0;}

        DB::insert("insert into client (nom, prenom, id_civilite) values ('".$nom."', '".$prenom."', ".$id_civ.")");
        DB::insert("insert into Numero_telephone (id_client, numero) values (".$id_client.", '".$num."')");
        return redirect()->route('liste_clients');
    }

}
