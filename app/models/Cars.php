<?php
  class Cars {
    private $db;

    public function __construct() {
      $this->db = new Database();
    }

    public function getCars() {
      $this->db->query("SELECT * FROM `cars`;");

      $result = $this->db->resultSet();

      return $result;
    }

    
  }

?>