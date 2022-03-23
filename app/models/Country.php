<?php
  class Country {
    private $db;

    public function __construct() {
      $this->db = new Database();
    }

    public function getCountries() {
      $this->db->query("SELECT * FROM `country`;");

      $result = $this->db->resultSet();

      return $result;
    }

    public function delCountry($id) {
      // echo is_string($id);exit();
      // $id = intval($id);
      // echo is_int($id);exit();
      // echo is_null(null);exit;
      $this->db->query("DELETE FROM `fruit` WHERE `id` = :id");
      $this->db->bind(':id', $id, PDO::PARAM_STR);
      return $this->db->execute();
    }

    public function selSingleCountry($id) {
      $this->db->query("SELECT * FROM `fruit` WHERE `id` = :id");
      $this->db->bind(':id', $id, PDO::PARAM_INT);
      return $this->db->single();
    }

    public function updateCountry($post) {
      $this->db->query("UPDATE `fruit` 
                        SET `name` = :name, 
                            `color` = :color, 
                            `price` = :price 
                        WHERE `fruit`.`id` = :id");
      $this->db->bind(':id', $post["id"], PDO::PARAM_INT);
      $this->db->bind(':id', $post["id"], PDO::PARAM_INT);
      $this->db->bind(':id', $post["id"], PDO::PARAM_INT);
      $this->db->bind(':id', $post["id"], PDO::PARAM_INT);
      return $this->db->single();
      $this->db->bind(':id', $id, PDO::PARAM_INT);
      return $this->db->single();
    }
  }

?>