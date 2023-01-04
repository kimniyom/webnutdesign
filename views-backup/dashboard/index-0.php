<?php 
    use yii\helpers\Url;

    use app\models\Dashboard;
    $Dashboard = new Dashboard();
?>
<div style="height: 10px;"></div>
<div class="row" style="margin-bottom: 0px;">
        <div class="col-lg-3" style=" padding-top: 60px;">
                            <div class="card">
                                <div class="card-body">
                                    <div class="card-title" style=" text-align: center; margin-bottom: 0px; ">
                                        <img class="img-circle" alt="user" src="<?php echo Url::to('@web/images/contacting.png') ?>" style=" margin-top: -80px; background: #ffffff;"><br/>
                                        <h4 style=" margin-top: 10px;">รับงาน</h4>
                                    </div>

                                    <div class="body-history" style="overflow: auto;">
                                        <div class="steamline m-t-40">
                                            <div class="sl-item">
                                                <div class="sl-left bg-success"> <i class="fa fa-check"></i></div>
                                                <div class="sl-right">
                                                    <div class="font-medium">วันนี้
                                                    </div>
                                                    <div class="desc">
                                                        จำนวนงาน <span class="badge badge-dark badge-pill"><?php echo $Dashboard->countCustomerToday() ?></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="sl-item">
                                                <div class="sl-left bg-info"> <i class="fa fa-info-circle"></i></div>
                                                <div class="sl-right">
                                                    <div class="font-medium">งานค้าง</div>
                                                    <div class="desc">
                                                        จำนวนงาน <span class="badge badge-dark badge-pill"><?php echo $Dashboard->countCustomerNoApprove() ?></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="sl-item">
                                                <div class="sl-left bg-info"> <i class="fa fa-info-circle"></i></div>
                                                <div class="sl-right">
                                                    <div class="font-medium">งานด่วนสำคัญ</div>
                                                    <div class="desc">
                                                        จำนวนงาน <span class="badge badge-dark badge-pill"><?php echo $Dashboard->countCustomerFast() ?></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="sl-item">
                                                <div class="sl-left bg-danger"> <i class="fa fa-remove"></i></div>
                                                <div class="sl-right">
                                                    <div class="font-medium">ยกเลิก</div>
                                                    <div class="desc">
                                                        จำนวนงาน <span class="badge badge-dark badge-pill"><?php echo $Dashboard->countCustomerCancel() ?></span>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3" style=" padding-top: 60px;">
                            <div class="card">
                                <div class="card-body">
                                    <div class="card-title" style=" text-align: center; margin-bottom: 0px; ">
                                        <img class="img-circle" alt="user" src="<?php echo Url::to('@web/images/Accounting-Calculator-icon.png') ?>" style=" margin-top: -80px; background: #ffffff; width: 96px;"><br/>
                                        <h4 style=" margin-top: 10px;">บัญชี</h4>
                                    </div>

                                    <div class="body-history" style="overflow: auto; margin-top: 0px; padding-top: 0px;">
                                        <div class="steamline m-t-40" style=" margin-top: 0px;">
                                            <div class="sl-item">
                                                <div class="sl-left bg-success"> <i class="fa fa-user"></i></div>
                                                <div class="sl-right">
                                                    <div class="font-medium">รอออกใบเสนอราคา
                                                    </div>
                                                    <div class="desc">
                                                        จำนวนงาน <span class="badge badge-primary badge-pill"><?php echo $Dashboard->countAccountNopaper() ?></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="sl-item">
                                                <div class="sl-left bg-info"><i class="fa fa-image"></i></div>
                                                <div class="sl-right">
                                                    <div class="font-medium">รอ Approve</div>
                                                    <div class="desc">
                                                        จำนวนงาน <span class="badge badge-primary badge-pill"><?php echo $Dashboard->countCustomerNoApprove() ?></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="sl-item">
                                                <div class="sl-left"> 
                                                    <img class="img-circle" alt="user"
                                                                           src="<?php echo Url::to('@web/images/users/1.png') ?>"> </div>
                                                <div class="sl-right">
                                                    <div class="font-medium">ส่งนอกร้าน</div>
                                                    <div class="desc">
                                                        ส่งนอกร้าน <span class="badge badge-primary badge-pill"><?php echo $Dashboard->countOutside() ?></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                                                <div class="col-lg-3" style=" padding-top: 60px;">
                            <div class="card">
                                <div class="card-body">
                                    <div class="card-title" style=" text-align: center; margin-bottom: 0px; ">
                                        <img class="img-circle" alt="user" src="<?php echo Url::to('@web/images/graphic-designer.png') ?>" style=" margin-top: -80px; background: #ffffff;"><br/>
                                        <h4 style=" margin-top: 10px;">กราฟิก</h4>
                                    </div>

                                    <div class="body-history" style="overflow: auto; margin-top: 0px; padding-top: 0px;">
                                        <div class="steamline m-t-40" style=" margin-top: 0px;">
                                            <div class="sl-item">
                                                <div class="sl-left bg-success"> <i class="fa fa-user"></i></div>
                                                <div class="sl-right">
                                                    <div class="font-medium">งานค้าง
                                                    </div>
                                                    <div class="desc">
                                                        จำนวนงาน <span class="badge badge-primary badge-pill"><?php echo $Dashboard->countGraphicNopaper() ?></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="sl-item">
                                                <div class="sl-left bg-info"><i class="fa fa-check"></i></div>
                                                <div class="sl-right">
                                                    <div class="font-medium">งานเสร็จ(วันนี้)</div>
                                                    <div class="desc">
                                                        จำนวนงาน <span class="badge badge-primary badge-pill"><?php echo $Dashboard->countGraphicApproveToday() ?></span>
                                                    </div>
                                                </div>
                                            </div>
                    
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3" style=" padding-top: 60px;">
                            <div class="card">
                                <div class="card-body">
                                    <div class="card-title" style=" text-align: center; margin-bottom: 0px;">
                                        <img class="img-circle" alt="user" src="<?php echo Url::to('@web/images/laser-cutting-machine.png')?>" style=" margin-top: -80px; background: #ffffff;"><br/>
                                        <h4 style=" margin-top: 10px;">ฝ่ายผลิต</h4>
                                    </div>

                                    <div class="body-history" style="overflow: auto;">
                                        <div class="steamline m-t-40">
                                            <div class="sl-item">
                                                <div class="sl-left">
                                                    <img class="img-circle" alt="user" src="<?php echo Url::to('@web/images/printers.png')?>"> </div>
                                                <div class="sl-right">
                                                    <div class="font-medium">
                                                        <b>งานพิมพ์</b>
                                                    </div>
                                                    <div class="desc">
                                                        งานค้าง <span class="badge badge-info badge-pill"><?php echo $Dashboard->countPrintNoapprove() ?></span><br/>
                                                        ผลิตเสร็จวันนี้ <span class="badge badge-info badge-pill"><?php echo $Dashboard->countPrintApproveToday() ?></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="sl-item">
                                                <div class="sl-left"><img class="img-circle" alt="user" src="<?php echo Url::to('@web/images/milling-machine.png') ?>" style=" background: #eeeeee"> </div>
                                                <div class="sl-right">
                                                    <div class="font-medium"><b>CNC / LASER</b></div>
                                                    <div class="desc">
                                                       งานค้าง <span class="badge badge-info badge-pill"><?php echo $Dashboard->countLaserNoapprove() ?></span><br/>
                                                        ผลิตเสร็จวันนี้ <span class="badge badge-info badge-pill"><?php echo $Dashboard->countLaserApproveToday() ?></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="sl-item">
                                                <div class="sl-left"> <img class="img-circle" alt="user" src="<?php echo Url::to('@web/images/cogs.png') ?>" style=" background: #eeeeee"> </div>
                                                <div class="sl-right">
                                                    <div class="font-medium">ผลิตทั่วไป</div>
                                                    <div class="desc">
                                                        งานค้าง <span class="badge badge-info badge-pill"><?php echo $Dashboard->countFactureNoapprove() ?></span><br/>
                                                        ผลิตเสร็จวันนี้ <span class="badge badge-info badge-pill"><?php echo $Dashboard->countFactureApproveToday() ?></span>


                                                    </div>
                                                </div>
                                            </div>
                                            <div class="sl-item">
                                                <div class="sl-left"> <img class="img-circle" alt="user" src="<?php echo Url::to('@web/images/engineer.png') ?>" style=" background: #eeeeee"> </div>
                                                <div class="sl-right">
                                                    <div class="font-medium">ช่าง / ติดตั้ง</div>
                                                    <div class="desc">
                                                        งานค้าง <span class="badge badge-info badge-pill"><?php echo $Dashboard->countQueueNoapprove() ?></span><br/>
                                                        ผลิตเสร็จวันนี้ <span class="badge badge-info badge-pill"><?php echo $Dashboard->countQueueApproveToday() ?></span>


                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3" style=" padding-top: 60px;">
                            <div class="card">
                                <div class="card-body">
                                    <div class="card-title" style=" text-align: center; margin-bottom: 0px;">
                                        <img class="img-circle" alt="user" src="<?php echo Url::to('@web/images/data-transport-icon.png')?>" style=" margin-top: -80px; background: #ffffff;"><br/>
                                        <h4 style=" margin-top: 10px;">ฝ่ายจัดส่ง</h4>
                                    </div>

                                    <div class="body-history" style="overflow: auto;">
                                        <div class="steamline m-t-40" style=" margin-top: 0px;">
                                            <div class="sl-item">
                                                <div class="sl-left bg-success"> <i class="fa fa-user"></i></div>
                                                <div class="sl-right">
                                                    <div class="font-medium">งานค้าง
                                                    </div>
                                                    <div class="desc">
                                                        จำนวนงาน <span class="badge badge-primary badge-pill"><?php echo $Dashboard->countTransportNoapprove() ?></span>
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="sl-item">
                                                <div class="sl-left bg-info"><i class="fa fa-check"></i></div>
                                                <div class="sl-right">
                                                    <div class="font-medium">งานเสร็จ(วันนี้)</div>
                                                    <div class="desc">
                                                        จำนวนงาน <span class="badge badge-primary badge-pill"><?php echo $Dashboard->countTransportApproveToday() ?> </span>
                                                    </div>
                                                </div>
                                            </div>
                    
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    
                    </div>
 <?php
        $this->registerJs('
            $(document).ready(function(){
                setScreens();
                
            });
         ');
        ?>
                    <script type="text/javascript">
                            function setScreens() {

                                var h = window.innerHeight;
                                var w = window.innerWidth;
                                $(".body-history").css({"height": h-265});

                                if(w < 500){
                                    $(".text-head").hide();
                                } else {
                                    $(".text-head").show();
                                }
                            }

                            
        </script>