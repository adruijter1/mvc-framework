<?php
class HomePages extends Controller {

  public function __construct() {
    // echo "Deze pagina is geladen";
    $this->userModel = $this->model('User');
  }

  public function index() {
    $data = [
      'title' => "Homepage",
      'name' => "Arjan de Ruijter is mijn naam"
    ];
    $this->view('homepages/index', $data);
  }
}