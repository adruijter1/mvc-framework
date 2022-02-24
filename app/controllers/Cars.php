<?php
class Cars extends Controller {

  public function index() {
    $data = [
      'title' => 'Cars from data',
    ];
    $this->view('cars/index', $data);
  }
}

?>