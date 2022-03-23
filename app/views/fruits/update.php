<form action="<?=URLROOT;?>/fruits/update" method="post">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">name</label>
    <input value="<?= $data['selFruit']->name; ?>" name="name" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">kleur</label>
    <input value="<?= $data['selFruit']->color; ?>" name="color" type="text" class="form-control" id="exampleInputPassword1">
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">prijs</label>
    <input value="<?= $data['selFruit']->price; ?>" name="price" type="text" class="form-control" id="exampleInputPassword1">
  </div> 
    <input value="<?= $data['selFruit']->id;?>" type="hidden" name="id"> 
  <button type="submit" class="btn btn-primary">update</button>
</form>