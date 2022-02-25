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
                  <td><a href='" . URLROOT . "/fruits/delete/$value->id'>delete</a></td>
                  <td><a href='" . URLROOT . "/homepages/index'>home</a></td>
                </tr>";
    }


    $data = [
      'title' => '<h1>Dit is de Fruit pagina<h1>',
      'fruits' => $rows
    ];
    $this->view('fruits/index', $data);
  }

  public function delete($id) {
    $deleteFruit = $this->fruitModel->delFruit($id);
    $this->index();

  }
}

?>