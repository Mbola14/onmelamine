<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', [
    'uses' => 'ClientsController@init'
]);

Route::get('/clients', [
    'uses' => 'ClientsController@init'
])->name('liste_clients');

Route::post('/ajoutClient', [
    'uses' => 'ClientsController@ajoutClient'
]);

Route::get('/contrat', [
    'uses' => 'ContratController@init'
])->name('liste_contrat');

Route::get('/ajoutContrat', [
    'uses' => 'ContratController@ajoutContratPage'
]);

Route::post('/ajouterContrat', [
    'uses' => 'ContratController@ajoutContrat'
]);

Route::get('/detailContrat/{id}', [
    'uses' => 'ContratController@set_id_contrat_session'
]);

Route::get('/detailContratValide/{id}', [
    'uses' => 'ContratController@set_id_contratvalide_session'
]);

Route::get('/returnDetailContrat', [
    'uses' => 'ContratController@detailContrat'
])->name('liste_mvt');

Route::post('/ajouterMvt', [
    'uses' => 'ContratController@ajoutMvt'
]);

Route::get('/accessoires', [
    'uses' => 'AccessoiresController@init'
])->name('liste_clients');

Route::get('/stock', [
    'uses' => 'StockController@init'
])->name('list_stock');

Route::post('/ajoutAccessoire', [
    'uses' => 'AccessoiresController@ajoutAccessoire'
]);

Route::post('/ajoutstock', [
    'uses' => 'StockController@ajoutstock'
]);

Route::get('/erreur', [
    'uses' => 'ErreurController@init'
])->name('erreur');

Route::get('/totalstock/{id}', [
    'uses' => 'AccessoiresController@stockFinalTotal'
]);

Route::get('/validerContrat', [
    'uses' => 'ContratController@validerContrat'
]);

Route::get('/confirmation', [
    'uses' => 'ContratController@confirmation'
]);

