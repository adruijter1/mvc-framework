<?php echo $data["title"]; ?>

<table>
  <thead>
    <th>id</th>
    <th>Land</th>
    <th>hoofdstad</th>
    <th>continent</th>
    <th>aantalinwoners</th>
  </thead>
  <tbody>
    <?=$data['countries']?>
  </tbody>
</table>
<a href="<?=URLROOT;?>/homepages/index">terug</a>

