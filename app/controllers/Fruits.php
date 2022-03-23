<?php
class Fruits extends Controller {

  public function __construct() {
    $this->fruitModel = $this->model('Fruit');
  }

  public function index() {
    /**
     * Haal via de method getFruits() uit de model Fruit de records op
     * uit de database
     */
    $fruits = $this->fruitModel->getFruits();
    
    /**
     * Maak de inhoud voor de tbody in de view
     */
    $rows = '';
    foreach ($fruits as $value){
      $rows .= "<tr>
                  <td>$value->id</td>
                  <td>$value->name</td>
                  <td>$value->color</td>
                  <td>$value->price</td>
                  <td><a href='/fruits/update/$value->id'>update</a></td>
                  <td><a href='/fruits/delete/$value->id'>delete</a></td>
                </tr>";
    }


    $data = [
      'title' => '<h1>Fruit overzicht<h1>',
      'fruits' => $rows
    ];
    // var_dump($data);exit();
    $this->view('fruits/index', $data);
  }

  public function delete($id) {
    $this->fruitModel->delFruit($id);
    header("Location:" . URLROOT . "/fruits/index");
  }

  public function update($id = null) {
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
      // echo 'post';exit;
      $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

      //  var_dump($_POST);exit();
      $this->fruitModel->updateFruit($_POST);
      header("Location: " . URLROOT . "/fruits/index");
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

      //  var_dump($_POST);exit();
      $this->fruitModel->updateFruit($_POST);
      header("Location: " . URLROOT . "/fruits/index");
    }
  }
}

?>