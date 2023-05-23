@extends('layouts.main')

@section('content')


  <div class="container-fluid py-4">
      <div class="row">
        <div class="col-12">
          <div class="card mb-4">
            <div class="card-header pb-0">
              @foreach($contrats as $contrat)
                <h6>{{$contrat->nom}} {{$contrat->prenom}} </h6>
                <h7>{{$contrat->nom_contrat}} </h7>
              @endforeach
            </div>
            <div class="card-body px-0 pt-0 pb-2">
              <div class="table-responsive p-0">
                <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">date</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">accessoire</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">entrées</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">sorties</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">stock final</th>
                      <th class="text-secondary opacity-7"></th>
                    </tr>
                  </thead>
                  <tbody>
                  @foreach($mouvements as $mouvement)
                      <tr>
                        <td>
                          <div class="d-flex px-2 py-1">
                            <div class="d-flex flex-column justify-content-center">
                              <h6 class="mb-0 text-sm">{{$mouvement->date_mouvement}}</h6>
                            </div>
                          </div>
                        </td>
                        <td>
                          <div class="d-flex px-2 py-1">
                            <div class="d-flex flex-column justify-content-center">
                              <h6 class="mb-0 text-sm">{{$mouvement->accessoire}}</h6>
                            </div>
                          </div>
                        </td>
                        <td>
                          <p class="text-xs font-weight-bold mb-0">{{$mouvement->entrees}} {{$mouvement->unite}}</p>
                          <p class="text-xs text-secondary mb-0"></p>
                        </td>
                        <td class="align-middle text-center">
                          <span class="text-secondary text-xs font-weight-bold">{{$mouvement->sorties}} {{$mouvement->unite}}</span>
                        </td>
                        <td class="align-middle text-center">
                          <span class="text-secondary text-xs font-weight-bold">{{$mouvement->stock_final}}</span>
                        </td>
                      </tr>
                    @endforeach
                    
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>

        <div class="align-middle text-center text-sm">
          <a href="/confirmation"><h6>Valider ce contrat</h6></a>
        </div>


      <div class="row">
        <div class="col-12">
          <div class="card mb-4">
            <div class="card-header pb-0">
              <h6>Ajouter un nouveau mouvement</h6>
            </div>
            <div class="card-body px-0 pt-0 pb-2">
              <div class="table-responsive p-0">
                <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">accessoire</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">entrées</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">sorties</th>
                      <th class="text-secondary opacity-7"></th>
                    </tr>
                  </thead>
                  <tbody>

                    <form action="/ajouterMvt" method="post">
                    <input type="hidden" name="_token" value="{{ csrf_token() }}">
                      <tr>
                      <td class="align-middle text-center text-sm">
                          <select name="id_accessoire">
                            @foreach($accessoires as $accessoire)
                              <option value="{{ $accessoire->id_accessoire }}">{{$accessoire->accessoire}}</option>
                            @endforeach
                          </select>
                        </td>
                        <td>
                        <input type="number" name="entrees" placeholder="entrées" min="0" required />
                        </td>
                        <td class="align-middle text-center text-sm">
                          <input type="number" name="sorties" placeholder="sorties" min="0" required />
                        </td>
                        <td><input type="submit" value="Ajouter" /></td>
                      </tr>
                    </form>

                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
      </div>


@stop