<?php
class Pages extends Controller {

  public function __construct() {
    // echo "Deze pagina is geladen";
    $this->userModel = $this->model('User');
  }

  public function index() {
    // echo 'Homepage';
    $users = $this->userModel->getUsers();
    $data = [
      'title' => "Thuis pagina",
      'name' => "Arjan de Ruijter",
      'users' => $users
    ];
    $this->view('pages/index', $data);
  }

  public function about() {
    // echo 'about';
    $this->view('pages/about');
  }
}