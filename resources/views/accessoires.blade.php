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
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Id</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Accessoire</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Unité</th>
                      <th class="text-secondary opacity-7"></th>
                    </tr>
                  </thead>
                  <tbody>
                  @foreach($accessoires as $accessoire)
                      <tr>
                        <td>
                          <div class="d-flex px-2 py-1">
                            <div class="d-flex flex-column justify-content-center">
                              <a href="/totalstock/{{$accessoire->id_accessoire}}"><h6 class="mb-0 text-sm">{{$accessoire->id_accessoire}}</h6></a>
                            </div>
                          </div>
                        </td>
                        <td>
                          <div class="d-flex px-2 py-1">
                            <div class="d-flex flex-column justify-content-center">
                            <a href="/totalstock/{{$accessoire->id_accessoire}}"><h6 class="mb-0 text-sm">{{$accessoire->accessoire}}</h6></a>
                            </div>
                          </div>
                        </td>
                        <td>
                        <a href="/totalstock/{{$accessoire->id_accessoire}}"><p class="text-xs font-weight-bold mb-0">{{$accessoire->unite}}</p></a>
                          <p class="text-xs text-secondary mb-0"></p>
                      </tr>
                    @endforeach
                    
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>



      <div class="row">
        <div class="col-12">
          <div class="card mb-4">
            <div class="card-header pb-0">
              <h6>Ajouter un nouveau </h6>
            </div>
            <div class="card-body px-0 pt-0 pb-2">
              <div class="table-responsive p-0">
                <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Nom de l'accessoire</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Unité</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Validation</th>
                    </tr>
                  </thead>
                  <tbody>

                    <form action="ajoutAccessoire" method="post">
                      <input type="hidden" name="_token" value="{{ csrf_token() }}">
                      <tr>
                        <td>
                          <input type="text" name="nom_accessoire" placeholder="nom" required />
                        </td>
                        <td>
                          <input type="text" name="unite" placeholder="unité" required />
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