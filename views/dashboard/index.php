<?php 
    use yii\helpers\Url;
    use app\models\Dashboard;
    $Dashboard = new Dashboard();
?>
<style type="text/css">
    .has-search .form-control {
        padding-left: 2.375rem;
    }
    .has-search .form-control-feedback {
        position: absolute;
        z-index: 2;
        display: block;
        width: 2.375rem;
        height: 2.375rem;
        line-height: 2.375rem;
        text-align: center;
        pointer-events: none;
        color: #aaa;
    }

    .meter {
        box-sizing: content-box;
        height: 15px; /* Can be anything */
        position: relative;
        margin: 0px 0 0px 0; /* Just for demo spacing */
        background: #d5a7c4;
        border-radius: 25px;
        padding: 2px;
        box-shadow: inset 0 -1px 1px rgba(255, 255, 255, 0.3);
    }
    .meter > span {
        display: block;
        height: 100%;
        border-top-right-radius: 8px;
        border-bottom-right-radius: 8px;
        border-top-left-radius: 20px;
        border-bottom-left-radius: 20px;
        background-color: rgb(43, 194, 83);
        background-image: linear-gradient(
            center bottom,
            rgb(43, 194, 83) 37%,
            rgb(84, 240, 84) 69%
            );
        box-shadow: inset 0 2px 9px rgba(255, 255, 255, 0.3),
            inset 0 -2px 6px rgba(0, 0, 0, 0.4);
        position: relative;
        overflow: hidden;
    }
    .meter > span:after,
    .animate > span > span {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        bottom: 0;
        right: 0;
        background-image: linear-gradient(
            -45deg,
            rgba(255, 255, 255, 0.2) 25%,
            transparent 25%,
            transparent 50%,
            rgba(255, 255, 255, 0.2) 50%,
            rgba(255, 255, 255, 0.2) 75%,
            transparent 75%,
            transparent
            );
        z-index: 1;
        background-size: 50px 50px;
        animation: move 2s linear infinite;
        border-top-right-radius: 8px;
        border-bottom-right-radius: 8px;
        border-top-left-radius: 20px;
        border-bottom-left-radius: 20px;
        overflow: hidden;
    }
    .animate > span:after {
        display: none;
    }
    .orange > span {
        background-image: linear-gradient(#f1a165, #f36d0a);
    }

    .red > span {
        background:#b1207b;
    }

    .nostripes > span > span,
    .nostripes > span::after {
        background-image: none;
    }
</style>
<div style="padding: 10px; padding-top: 20px;">
    <div class="row" style="margin-bottom: 0px;">
        <div class="col-lg-8 col-md-8 b-lrft">
            <div class="body-history" style="overflow: auto;"> 
                <div class="row" style=" margin: 0px;">  
                    <div class="col-md-12 col-lg-12">
                        <div class="card">
                            <div class="card-content">
                                <div class="card-header"><?php echo "เดือน พฤษภาคม" ?></div>
                                <div class="card-body" style="height: 300px;">
                                    <canvas id="chartSumMonth" style="width: 100%; height: 100%;"></canvas>
                                </div>
                            </div>
                        </div>                         
                    </div>
                </div>

                <div class="row" style=" margin: 0px;">
                    <div class="col-md-7 col-lg-7">
                        <div class="card">
                            <div class="card-content">
                                <div class="card-body" style="height: 250px; font-family: skv;">
                                    <div class="row">
                                        <div class="col-md-6 col-lg-8 col-8">
                                            <label style=" padding: 0px; position: absolute; top: -10px; text-align: center; width: 100%;">ปริมาณค้างงานในระบบวันนี้</label>
                                            <canvas id="chartJobNonApprove" style="height: 180px; width: 100%; margin-top: 15px;"></canvas>
                                            <label style=" padding: 0px; position: absolute; width: 100%; bottom: -33px; text-align: center;">
                                                <font style=" text-align: center; background: #d25fa0; color: #FFFFFF; margin-top: 20px; padding: 5px;">คิวงานทั้งหมด</font>
                                            </label>
                                        </div>
                                        <div class="col-md-6 col-lg-4 col-4" style=" margin-top: 15px;">
                                            <table style=" width: 100%;">
                                                <tr>
                                                    <td>บัญชี</td>
                                                    <td style=" text-align: right;"><?php echo $Dashboard->countAccountNopaperAll() ?></td>
                                                </tr>
                                                <tr>
                                                    <td>กราฟิก</td>
                                                    <td style=" text-align: right;"><?php echo $Dashboard->countGraphicNoapproveAll() ?></td>
                                                </tr>
                                                <tr>
                                                    <td>งานพิมพ์</td>
                                                    <td style=" text-align: right;"><?php echo $Dashboard->countPrintNoapproveAll() ?></td>
                                                </tr>
                                                <tr>
                                                    <td>CNC/Laser</td>
                                                    <td style=" text-align: right;"><?php echo $Dashboard->countLaserNoapproveAll() ?></td>
                                                </tr>
                                                <tr>
                                                    <td>ผลิตทั่วไป</td>
                                                    <td style=" text-align: right;"><?php echo $Dashboard->countFactureNoapproveAll() ?></td>
                                                </tr>
                                                <tr>
                                                    <td>ช่างติดตั้ง</td>
                                                    <td style=" text-align: right;"><?php echo $Dashboard->countSetupNoapproveAll() ?></td>
                                                </tr>
                                                <tr>
                                                    <td>จัดส่ง</td>
                                                    <td style=" text-align: right;"><?php echo $Dashboard->countTransportNoapproveAll() ?></td>
                                                </tr>
                                                <tr>
                                                    <td>รับหน้าร้าน</td>
                                                    <td style=" text-align: right;"><?php echo $Dashboard->countNoTransportNoapproveAll() ?></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5 col-lg-5">
                        <div class="card">
                            <div class="card-content">
                                <div class="card-body" style="height: 250px; font-family: skv;">
                                    <label style=" padding: 0px; position: absolute; top: 10px; text-align: left; width: 95%;">ตามระดับความด่วน 1-5</label>
                                    <canvas id="chartJobLevel" style="height: 180px; width: 100%; margin-top: 15px;"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                    <div id="jobtoday"></div>
                
            </div><!-- End control Box -->
        </div><!-- end Col -->
        <div class="col-lg-4 col-md-4 b-right">
            <div class="row" style=" margin: 0px;">
                <div class="col-12 b-right">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-body">
                              <div class="form-group has-search" style="margin-bottom: 0px;">
                                <span class="fa fa-search form-control-feedback"></span>
                                <input type="text" class="form-control" placeholder="ค้นหา...พิมพ์ชื่องานที่นี้" id="txtsearch">
                              </div>
                              <div style="height: 268px; overflow: auto;">
                                <div id="job"></div>
                              </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row" style="margin:0px;">
                <div class="col-12 b-right">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-body">
                                <div style="height: 209px; overflow: auto;">
                                    <table style="width: 100%; font-family: skv;">
                                    <label style=" padding: 0px; position: relative; top: 0px; text-align: center; width: 100%; font-family: skv; font-size: 20px; border-bottom: solid 2px #b1207b;">ปริมาณงานต่อลูกค้า</label>
                                    <?php foreach($listCategory as $cat): ?>
                                        <tr>
                                            <td><?php echo $cat['typename'] ?></td>
                                            <td style="text-align: right;">
                                                <label style="background: #dd4a06; border-radius: 10px; padding: 0px 5px; color: #ffffff;"><?php echo $cat['total'] ?></label>
                                                    
                                                </td>
                                          </tr>
                                    <?php endforeach ?>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row" style=" margin: 0px;">
                <div class="col-12 b-right">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-body">
                              <div class="body-dasboard-right"> 
                                <div style="position: relative;  width: 100%; bottom: 0px; padding-bottom: 30px; height: 210px;">
                                    <label style=" padding: 0px; position: relative; top: 0px; text-align: center; width: 100%; font-family: skv; font-size: 20px; border-bottom: solid 2px #b1207b;">ช่องทางที่ลูกค้าติดต่อมา</label>
                                    <table style=" width: 100%;">
                                        <tr>
                                            <td style=" width: 130px;">
                                                <div style=" width: 120px; height: 120px; float: left;">
                                                    <canvas id="chartJobType" style="height: 100%; width: 100%; margin-top: 15px; margin-top: 30px; float: left;"></canvas>
                                                </div>
                                            </td>
                                            <td style=" padding-top: 20px; font-family: skv; font-size: 18px;">
                                                <?php 
                                                    $countTotal = ($Dashboard->countCustomerType(1) + $Dashboard->countCustomerType(0));
                                                    $percent = ($Dashboard->countCustomerType(1) * $countTotal) / 100;
                                                ?>
                                                <table style=" width: 100%;">
                                                    <tr>
                                                        <td>ออนไลน์</td>
                                                        <td><?php echo $Dashboard->countCustomerType(1) ?></td>
                                                    </tr>
                                                    <tr>
                                                        <td>หน้าร้าน</td>
                                                        <td><?php echo $Dashboard->countCustomerType(0) ?></td>
                                                    </tr>
                                                </table>
                                                <div class="meter red nostripes">
                                                    <span style="width: 80%; font-size: 12px; color: #FFFFFF; text-align: center;">
                                                        <?php echo $percent ?> %
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
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
            getChart();
            getPieChart();
            getLevel();
            getPieChartTypeOnline();
            getWork();
        });

        $(document).keypress(function(event){
            var keycode = (event.keyCode ? event.keyCode : event.which);
            if(keycode == "13"){
                searchWork();
            }
        });
    ');
?>

<script type="text/javascript">
    function setScreens() {
        var h = window.innerHeight;
        var w = window.innerWidth;
        if(w < 500){
            $(".text-head").hide();
        } else {
            $(".text-head").show();                         
        }

        if(w > 768){
            //$(".body-history").css({"height": h-100});
            //$(".body-dasboard-right").css({"height": h-255});
            $(".b-left").css({"padding-right": "0px"});
            $(".b-right").css({"padding-left": "0px"});
        }
    }

    function searchWork(){
        var project = $("#txtsearch").val();
        if(project == ""){
            $("#txtsearch").focus();
        }

        $("#job").html("<h4 style='text-align:center;'>Loading ...</h4>");
        var url = "<?php echo Yii::$app->urlManager->createUrl(['dashboard/searchjob']) ?>";
        var data = {project: project};
        $.post(url, data, function(res) {
            $("#job").html(res);
        });
        
    }

    function getWork(){
        $("#jobtoday").html("<p style='text-align:center;'>Loading ...</p>");
        var url = "<?php echo Yii::$app->urlManager->createUrl(['dashboard/getqueue']) ?>";
        var data = {};
        $.post(url, data, function(res) {
            $("#jobtoday").html(res);
        });
        
    }

    function getChart(){
        var ctx = document.getElementById('chartSumMonth').getContext("2d");
        var gradientStroke = ctx.createLinearGradient(500, 0, 100, 0);
        gradientStroke.addColorStop(0, '#80b6f4');
        gradientStroke.addColorStop(1, '#f49080');

        var myChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: [<?php echo $label ?>],
                datasets: [{
                label: "จำนวนงาน",
                borderColor: gradientStroke,
                pointBorderColor: gradientStroke,
                pointBackgroundColor: gradientStroke,
                pointHoverBackgroundColor: gradientStroke,
                pointHoverBorderColor: gradientStroke,
                pointBorderWidth: 10,
                pointHoverRadius: 10,
                pointHoverBorderWidth: 1,
                pointRadius: 3,
                fill: false,
                borderWidth: 4,
                    data: [<?php echo $value ?>]
                }]
            },
            options: {    
                tooltipTemplate: "",
                showTooltips: true,      
                legend: {
                    display: true,
                    position: "bottom"
                },
                hover: {
                    animationDuration: 0
                },
                onAnimationComplete: function() {
                    this.showTooltip(this.datasets[0].points, true);
                },
                tooltipEvents: [],
                tooltips: {
                    enabled: true
                },
                scales: {
                    yAxes: [{
                        display: true,
                            ticks: {
                                fontColor: "rgba(0,0,0,0.5)",
                                fontStyle: "bold",
                                beginAtZero: true,
                                maxTicksLimit: 5,
                                padding: 20
                            },
                            gridLines: {
                                drawTicks: false,
                                display: false
                            }
                    }],
                    xAxes: [{
                        display: true,
                        gridLines: {
                            zeroLineColor: "transparent"
                        },
                        ticks: {
                            precision: 0,
                            padding: 20,
                            fontColor: "rgba(0,0,0,0.5)",
                            fontStyle: "bold"
                        }
                    }]
                }
            }
        });
    }

    function getPieChart(){
        var ctxs = document.getElementById('chartJobNonApprove').getContext("2d");
        var campaignDonut = new Chart(ctxs, {
            type: 'doughnut',
            data: {
                labels: [
                    'บัญชี',
                    'กราฟิก',
                    'งานพิมพ์',
                    'CNC/Laser',
                    'ผลิตทั่วไป',
                    'ช่างติดตั้ง',
                    'จัดส่ง',
                    'รับหน้าร้าน'
                ], 
                datasets: [{
                    label: 'My First Dataset',
                    data: [
                            <?php echo $Dashboard->countAccountNopaperAll() ?>, 
                            <?php echo $Dashboard->countGraphicNoapproveAll() ?>, 
                            <?php echo $Dashboard->countPrintNoapproveAll() ?>,
                            <?php echo $Dashboard->countLaserNoapproveAll() ?>,
                            <?php echo $Dashboard->countFactureNoapproveAll() ?>,
                            <?php echo $Dashboard->countSetupNoapproveAll() ?>,
                            <?php echo $Dashboard->countTransportNoapproveAll() ?>,
                            <?php echo $Dashboard->countNoTransportNoapproveAll() ?>
                        ],
                    backgroundColor: [
                        '#d5a7c4',
                        '#ce85b0',
                        '#d560a4',
                        '#d15498',
                        '#ca56a7',
                        '#be2f89',
                        '#cb1e91',
                        '#b1207b'
                    ],
                    hoverOffset: 4
                }]
            },
            options: {
                    plugins: {
                        legend: {
                            display: false
                        },
                    },  
                    maintainAspectRatio : false,
                    aspectRatio: 1,
                    layout: {
                        padding: {
                            left: 0,
                            right: 0,
                            top: 0,
                            bottom: 0,
                        }
                    },
                    responsive: true,
                    cutoutPercentage: 90,
                }
            });
    }  

    function getLevel(){
        var ctxs = document.getElementById('chartJobLevel').getContext("2d");
        var campaignDonut = new Chart(ctxs, {
            type: 'bar',
            data: {
                labels: [
                    'Level 1',
                    'Level 2',
                    'Level 3',
                    'Level 4',
                    'Level 5'
                ], 
                datasets: [{
                    label: 'จำนวนงาน',
                    data: [
                            <?php echo $Dashboard->countLevel(1) ?>, 
                            <?php echo $Dashboard->countLevel(2) ?>, 
                            <?php echo $Dashboard->countLevel(3) ?>,
                            <?php echo $Dashboard->countLevel(4) ?>,
                            <?php echo $Dashboard->countLevel(5) ?>
                        ],
                    backgroundColor: [
                        '#3b693b',
                        '#88bb52',
                        '#f6eb3b',
                        '#ff4800',
                        '#ff000c'
                    ],
                    hoverOffset: 4
                }]
            },
            options: {
                    plugins: {
                        legend: {
                            display: false
                        },
                    },  
                    maintainAspectRatio : false,
                    aspectRatio: 1,
                    layout: {
                        padding: {
                            left: 0,
                            right: 0,
                            top: 0,
                            bottom: 0,
                        }
                    },
                    responsive: true,
                    cutoutPercentage: 90,
                }
            });
    }

    function getPieChartTypeOnline(){

        var ctxs = document.getElementById('chartJobType').getContext("2d");
        var campaignDonut = new Chart(ctxs, {
            type: 'doughnut',
            data: {
                labels: [
                    'ออนไลน์',
                    'หน้าร้าน'
                ], 
                datasets: [{
                    //label: 'My First Dataset',
                    data: [
                            <?php echo $Dashboard->countCustomerType(1) ?>, 
                            <?php echo $Dashboard->countCustomerType(0) ?>
                        ],
                    backgroundColor: [
                        '#b1207b',
                        '#d5a7c4'
                    ],
                    hoverOffset: 4
                }]
            },
            options: {
                    plugins: {
                        legend: {
                            display: false
                        },
                    },  
                    maintainAspectRatio : false,
                    aspectRatio: 1,
                    layout: {
                        padding: {
                            left: 0,
                            right: 0,
                            top: 0,
                            bottom: 0,
                        }
                    },
                    responsive: false,
                    cutoutPercentage: 90,
                }
            });
    }                 
</script>