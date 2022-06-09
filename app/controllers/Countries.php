<?php
namespace TDD\controllers;

use TDD\libraries\Controller;

class Countries extends Controller {
  // Properties, field
  private $countryModel;

  // Dit is de constructor
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
                  <td>" . $value->name . "</td>
                  <td>" . $value->capitalCity . "</td>
                  <td>" . $value->continent . "</td>
                  <td>" . number_format($value->population, 0, ',', '.') . "</td>
                  <td><a href='" . URLROOT . "/countries/update/$value->id'><i class='bi bi-pencil-square'></i></a></td>
                  <td><a href='" . URLROOT . "/countries/delete/$value->id'><i class='bi bi-x-square'></i></a></td>
                </tr>";
    }


    $data = [
      'title' => '<h3>Landenoverzicht</h3>',
      'countries' => $rows
    ];
    $this->view('countries/index', $data);
  }

  public function update($id = null) {
    // var_dump($id);exit();
    // var_dump($_SERVER);exit();
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
      $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
      $this->countryModel->updateCountry($_POST);
      header("Location: " . URLROOT . "/countries/index");
    } else {
      $row = $this->countryModel->getSingleCountry($id);
      $data = [
        'title' => '<h3>Update landenoverzicht</h3>',
        'row' => $row
      ];
      $this->view("countries/update", $data);
    }
  }

  public function delete($id) {
    $this->countryModel->deleteCountry($id);

    $data =[
      'deleteStatus' => "Het record met id = $id is verwijdert"
    ];
    $this->view("countries/delete", $data);
    header("Refresh:3; url=" . URLROOT . "/countries/index");
  }

  public function create() {
    /**
     * Default waarden voor de view create.php
     */

    $data = [
      'title' => '<h3>Voeg een nieuw land in</h3>',
      'name' => '',
      'capitalCity' => '',
      'continent' => '',
      'population' => '',
      'nameError' => '',
      'capitalCityError' => '',
      'continentError' => '',
      'populationError' => ''
    ];

    if ($_SERVER["REQUEST_METHOD"] == "POST") {

        $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

        $data = [
          'title' => '<h3>Voeg een nieuw land in</h3>',
          'name' => trim($_POST['name']),
          'capitalCity' => trim($_POST['capitalCity']),
          'continent' => trim($_POST['continent']),
          'population' => trim($_POST['population']),
          'nameError' => '',
          'capitalCityError' => '',
          'continentError' => '',
          'populationError' => ''
        ];

        $data = $this->validateCreateForm($data);
        
        if (empty($data['nameError']) && empty($data['capitalCityError']) && empty($data['continentError']) && empty($data['populationError'])) {
          $this->countryModel->createCountry($_POST);
          header("Location:" . URLROOT . "/countries/index");
        }
    } 

    $this->view("countries/create", $data);    
  }

  public function validateCreateForm($data) {
    if (empty($data['name'])) {
      $data['nameError'] = 'U heeft nog geen land ingevuld';
    } elseif (filter_var($data['name'], FILTER_VALIDATE_EMAIL)) {
      $data['nameError'] = 'U heeft blijkbaar een emailadres ingevuld';
    } elseif(!preg_match('/^[a-zA-Z]*$/', $data['name'])) {
      $data['nameError'] = 'U heeft andere tekens gebruikt dan die in het alfabet';
    }

    if (empty($data['capitalCity'])) {
      $data['capitalCityError'] = 'U heeft nog geen hoofdstad van het land ingevuld';
    }

    if (empty($data['continent'])) {
      $data['continentError'] = 'U heeft nog geen continent ingevuld';
    } elseif (!in_array($data['continent'], ['Afrika','Antartica','Azie','Australie/Oceanie','Europa','Noord-Amerika','Zuid-Amerika'])) {
      $data['continentError'] = 'U heeft een niet bestaand continent opgegeven, probeer het opnieuw';
    }

    if (empty($data['population'])) {
      $data['populationError'] = 'U heeft nog niet het inwonersaantal van het land ingevuld';
    } elseif($data['population'] > 4294967295) {
      $data['populationError'] = 'U heeft een te groot inwonersaantal ingevuld';
    }

    return $data;
  }

  public function scanCountry() {
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
      $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

      $record = $this->countryModel->getSingleCountryByName($_POST["country"]);

      $rowData = "<tr>
                    <td>$record->id</td>
                    <td>$record->name</td>
                    <td>$record->capitalCity</td>
                    <td>$record->continent</td>
                    <td>$record->population</td>
                  </tr>";

      $data = [
        'title' => 'Dit is het gescande land',
        'rowData' => $rowData
      ];

      $this->view('countries/scanCountry', $data);
    } else {
      $data = [
        'title' => 'Scan het land',
        'rowData' => ""
      ];

      $this->view('countries/scanCountry', $data);
    }
  }

  public function sayMyName()
  {
    return "Arjan";
  }
}

?>