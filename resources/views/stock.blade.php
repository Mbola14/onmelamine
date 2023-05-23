@extends('layouts.main')

@section('content')

  <div class="container-fluid py-4">
      <div class="row">
        <div class="col-12">
          <div class="card mb-4">
            <div class="card-header pb-0">
              <h6>Liste des accessoires</h6>
            </div>
            <div class="card-body px-0 pt-0 pb-2">
              <div class="table-responsive p-0">
                <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">nom du contrat</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">nom du client</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Accessoire</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">mouvement</th>
                      <th class="text-secondary opacity-7"></th>
                    </tr>
                  </thead>
                  <tbody>
                  @foreach($stock_final as $stock)
                      <tr>
                        <td>
                          <div class="d-flex px-2 py-1">
                            <div class="d-flex flex-column justify-content-center">
                              <h6 class="mb-0 text-sm">{{$stock->nom_contrat}}</h6>
                            </div>
                          </div>
                        </td>
                        <td>
                          <div class="d-flex px-2 py-1">
                            <div class="d-flex flex-column justify-content-center">
                              <h6 class="mb-0 text-sm">{{$stock->nom}} {{$stock->prenom}}</h6>
                            </div>
                          </div>
                        </td>
                        <td>
                          <p class="text-xs font-weight-bold mb-0">{{$stock->accessoire}}</p>
                          <p class="text-xs text-secondary mb-0"></p>
                        </td>
                        <td>
                          <p class="text-xs font-weight-bold mb-0">{{$stock->stock_final}} {{$stock->unite}}</p>
                          <p class="text-xs text-secondary mb-0"></p>
                        </td>
                      </tr>
                    @endforeach
                    <tr>
                      <td></td>
                      <td></td>
                      <td><h5>TOTAL :</h5></td>
                      <td>
                        <p class="text-xs font-weight-bold mb-0">{{$reste}} {{$stock->unite}}</p>
                        <p class="text-xs text-secondary mb-0"></p>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>      
    </div>


@stop