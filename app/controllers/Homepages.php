<?php
class HomePages extends Controller {

  public function index() {
    $data = [
      'title' => "Homepage",
      'name' => "Arjan de Ruijter is mijn naam"
    ];
    $this->view('homepages/index', $data);
  }
}