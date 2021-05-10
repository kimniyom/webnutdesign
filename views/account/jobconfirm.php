<ul class="list-group" style=" padding: 0px; margin: 0px; border-radius: 0px;">
    <?php foreach ($job as $jobs): ?>
        <li class="list-group-item account-list-group" style="border: none; border-bottom: solid 1px #eeeeee; cursor: pointer;" onclick="popupMenu('<?php echo $jobs['ref'] ?>')">
            <h4>งาน: <?php echo $jobs['project_name'] ?></h4>
            <p>ลูกค้า:<?php echo $jobs['customer'] ?></p>
        </li>
    <?php endforeach; ?>
</ul>