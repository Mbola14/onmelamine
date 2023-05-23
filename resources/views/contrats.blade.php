@extends('layouts.main')

@section('content')

  <div class="container-fluid py-4">
  <div><h2>Contrats En cours : </h2></div>
  <div class="col-md-4 mt-4">
        <a href="ajoutContrat">
        <div class="card-header pb-0 px-3">
          <h4>Nouveau contrat</h4>
        </div>
        </a>
      </div>


    <div class="row">
      @foreach($contrats as $contrat)

        <div class="col-md-4 mt-4">
          <a href="detailContrat/{{$contrat->id_contrat}}">
          <div class="card h-80 mb-4">
            <div class="card-header pb-0 px-3">
              <div class="row">
                <div class="card-body pt-4 p-3">
                  <h5 class="mb-0">{{$contrat->nom_contrat}}</h5>
                  <h7 class="mb-0">{{$contrat->date_debut}}</h7>
                  <h6 class="mb-0">En cours</h6>
                </div>
              </div>
            </div>
            <div class="card-body pt-4 p-3">
              <h6 class=" text-body text-xs font-weight-bolder mb-3">Client : {{$contrat->nom_civilite}} {{$contrat->nom}} {{$contrat->prenom}}</h6>
              <h6 class="text-uppercase text-body text-xs font-weight-bolder mb-3">Contact : {{$contrat->numero}}</h6>
              </div>
          </div>
          </a>
        </div>
      @endforeach
      </div>

<div><h2>Contrats validés : </h2></div>
    <div class="row">
      @foreach($valides as $valide)
        <div class="col-md-4 mt-4">
          <a href="detailContratValide/{{$valide->id_contrat}}">
          <div class="card h-80 mb-4">
            <div class="card-header pb-0 px-3">
              <div class="row">
                <div class="card-body pt-4 p-3">
                  <h5 class="mb-0">{{$valide->nom_contrat}}</h5>
                  <h7 class="mb-0">{{$valide->date_debut}} au {{$valide->date_validation}}</h7>
                  <h6 class="mb-0">Validé</h6>
                </div>
              </div>
            </div>
            <div class="card-body pt-4 p-3">
              <h6 class=" text-body text-xs font-weight-bolder mb-3">Client : {{$valide->nom_civilite}} {{$valide->nom}} {{$valide->prenom}}</h6>
              <h6 class="text-uppercase text-body text-xs font-weight-bolder mb-3">Contact : {{$valide->numero}}</h6>
              </div>
          </div>
          </a>
        </div>
      @endforeach
      </div>

@stop