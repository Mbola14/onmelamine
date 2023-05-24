@extends('layouts.main')

@section('content')

  <div class="container-fluid py-4">
      <div class="row">
        <div class="col-12">
          <div class="card mb-4">
            <div class="card-header pb-0">
              <h6>Liste des stocks</h6>
            </div>
            <div class="card-body px-0 pt-0 pb-2">
              <div class="table-responsive p-0">
                <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Accessoire</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Stock</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Unité</th>
                      <th class="text-secondary opacity-7"></th>
                    </tr>
                  </thead>
                  <tbody>
                  @foreach($stocks as $stock)
                      <tr>
                        <td>
                          <div class="d-flex px-2 py-1">
                            <div class="d-flex flex-column justify-content-center">
                              <h6 class="mb-0 text-sm">{{$stock->accessoire}}</h6>
                            </div>
                          </div>
                        </td>
                        <td>
                          <div class="d-flex px-2 py-1">
                            <div class="d-flex flex-column justify-content-center">
                            <h6 class="mb-0 text-sm">{{$stock->stock}}</h6>
                            </div>
                          </div>
                        </td>
                        <td>
                        <p class="text-xs font-weight-bold mb-0">{{$stock->unite}}</p>
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
              <h6>Ajouter au stock </h6>
            </div>
            <div class="card-body px-0 pt-0 pb-2">
              <div class="table-responsive p-0">
                <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Choisir l'accessoire</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Valeur</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Unité</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Validation</th>
                    </tr>
                  </thead>
                  <tbody>

                    <form action="ajoutstock" method="post">
                      <input type="hidden" name="_token" value="{{ csrf_token() }}">
                      <tr>
                        <td>
                        <select name="id_accessoire" id="accessoire">
                            @foreach($stocks as $stock)
                              <option value="{{ $stock->id_accessoire }}" id="{{$stock->unite}}">{{$stock->accessoire}}</option>
                            @endforeach
                          </select>
                        </td>
                        <td>
                          <input type="number" id="stock" name="stock" placeholder="unité" min="0" required />
                        </td>
                        <td>
                          <p id="unite">unité</p>
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

      <script>
// Récupérer les éléments du DOM
const selectAccessoire = document.getElementById('accessoire');
const uniteElement = document.getElementById('unite');

// Écouter l'événement de changement du select
selectAccessoire.addEventListener('change', function() {
  // Obtenir la valeur sélectionnée dans le select
  var selectedOption = selectAccessoire.options[selectAccessoire.selectedIndex];
    var accessory = selectedOption.id;
  
  // Mettre à jour la valeur du paragraphe "unite"
  uniteElement.textContent = accessory;
});
</script>


@stop