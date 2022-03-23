<?php
class Countries extends Controller {

  public function __construct() {
    $this->countryModel = $this->model('Country');
  }

  public function index() {
    /**
     * Haal via de method getFruits() uit de model Fruit de records op
     * uit de database
     */
    $countries = $this->countryModel->getCountries();

    /**
     * Maak de inhoud voor de tbody in de view
     */
    $rows = '';
    foreach ($countries as $value){
      $rows .= "<tr>
                  <td>$value->id</td>
                  <td>" . htmlentities($value->name, ENT_QUOTES, 'ISO-8859-1') . "</td>
                  <td>" . htmlentities($value->capitalCity, ENT_QUOTES, 'ISO-8859-1') . "</td>
                  <td>" . htmlentities($value->continent, ENT_QUOTES, 'ISO-8859-1') . "</td>
                  <td>" . number_format($value->population, 0, ',', '.') . "</td>
                </tr>";
    }


    $data = [
      'title' => '<h1>Landenoverzicht<h1>',
      'countries' => $rows
    ];
    $this->view('countries/index', $data);
  }

  public function delete($id) {
    $deleteFruit = $this->fruitModel->delFruit($id);
    $this->index();
  }

  public function update($id) {
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
      echo 'post';exit;
    }
    $row = $this->fruitModel->selSingleFruit($id);
    // var_dump($row);exit;
    $data = [
      'selFruit' => $row
    ];
  $this->view('fruits/update', $data);
  }

  public function update_script() {
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
      $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

      // var_dump($_POST);exit();
      $this->fruitModel->updateFruit($_POST);
      // echo 'post';exit;
    }
    
    
  $this->view('fruits/index');
  }
}

?>