<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Http\Requests;

class ContratController extends Controller
{
    public function init()
    {
        $select = DB::select("SELECT * FROM v_contrat ORDER BY date_debut");
        $valide = DB::select("SELECT * FROM v_contratvalide ORDER BY date_debut DESC");
        return view ('contrats', [
            'contrats' => $select,
            'valides' => $valide
        ]);
    }

    public function ajoutContratPage(){
        $select = DB::select("SELECT * FROM client ORDER BY nom ASC, prenom ASC");
        return view ('ajoutContrat', [
            'clients' => $select
        ]);
    }

    public function ajoutContrat(Request $request)
    {
        $nom_contrat = $request->input('nom_contrat');
        $id_client = $request->input('id_client');

        DB::insert("insert into contrat (nom_contrat, id_client, date_debut) values ('".$nom_contrat."', '".$id_client."', DATE(NOW()))");
        return redirect()->route('liste_contrat');
    }

    public function set_id_contrat_session($id_contrat)
    {
        session_start();
        $_SESSION['id_contrat'] = $id_contrat;

        $select = DB::select("SELECT * FROM v_mvt WHERE id_contrat = ".$id_contrat);
        $sel = DB::select("SELECT * FROM v_allContrats WHERE id_contrat = ".$id_contrat);
        $accessoire = DB::select("SELECT * FROM accessoire");

        return view('mouvements', [
            'mouvements' => $select,
            'accessoires' => $accessoire,
            'contrats' => $sel
        ]);
    }

    public function set_id_contratvalide_session($id_contrat)
    {
        session_start();
        $_SESSION['id_contrat'] = $id_contrat;

        $select = DB::select("SELECT * FROM v_mvt WHERE id_contrat = ".$id_contrat);
        $sel = DB::select("SELECT * FROM v_allContrats WHERE id_contrat = ".$id_contrat);
        $accessoire = DB::select("SELECT * FROM accessoire");

        return view('valides', [
            'mouvements' => $select,
            'accessoires' => $accessoire,
            'contrats' => $sel
        ]);
    }

    public function detailContrat(){
        session_start();
        $id_contrat = $_SESSION['id_contrat'];

        $select = DB::select("SELECT * FROM v_mvt WHERE id_contrat = ".$id_contrat);
        $sel = DB::select("SELECT * FROM v_allContrats WHERE id_contrat = ".$id_contrat);
        $accessoire = DB::select("SELECT * FROM accessoire");

        return view('mouvements', [
            'mouvements' => $select,
            'accessoires' => $accessoire,
            'contrats' => $sel
        ]);
    }

    public function ajoutMvt(Request $request)
    {
        $id_accessoire = $request->input('id_accessoire');
        $entrees = $request->input('entrees');
        $sorties = $request->input('sorties');
        $stock_final = $entrees - $sorties;

        session_start();
        $id_contrat = $_SESSION['id_contrat'];

        echo 'tonga eto';
        DB::insert("INSERT INTO mouvement (date_mouvement, id_contrat, id_accessoire, entrees, sorties, stock_final) 
        VALUES (date(now()), ".$id_contrat.", ".$id_accessoire.", ".$entrees.", ".$sorties.", ".$stock_final.")");
        return redirect()->route('liste_mvt');
    }

    public function validerContrat(){
        session_start();
        $id_contrat = $_SESSION['id_contrat'];

        DB::insert("INSERT INTO validation (id_contrat, date_validation) VALUES (".$id_contrat.", date(now()))");
        return redirect()->route('liste_contrat');
    }

    public function confirmation(){
        return view('confirmation');
    }
}
