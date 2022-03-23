<?php
  class Fruit {
    private $db;

    public function __construct() {
      $this->db = new Database();
    }

    public function getFruits() {
      $this->db->query("SELECT * FROM `fruit`;");

      $result = $this->db->resultSet();

      return $result;
    }

    public function delFruit($id) {
      // echo is_string($id);exit();
      // $id = intval($id);
      // echo is_int($id);exit();
      // echo is_null(null);exit;
      $this->db->query("DELETE FROM `fruit` WHERE `id` = :id");
      $this->db->bind(':id', $id, PDO::PARAM_STR);
      return $this->db->execute();
    }

    public function selSingleFruit($id) {
      $this->db->query("SELECT * FROM `fruit` WHERE `id` = :id");
      $this->db->bind(':id', $id, PDO::PARAM_INT);
      return $this->db->single();
    }

    public function updateFruit($post) {
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