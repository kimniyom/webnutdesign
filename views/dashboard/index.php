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
                    <div class="col-md-8 col-lg-8">
                        <div class="card">
                            <div class="card-content">
                                <div class="card-body" style="height: 200px;">

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-lg-4">
                        <div class="card">
                            <div class="card-content">
                                <div class="card-body" style="height: 200px;">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" style=" margin: 0px;">
                    <div class="col-md-6 col-lg-6">
                        <div class="card">
                            <div class="card-content">
                                <div class="card-body" style="height:250px;">

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="card">
                            <div class="card-content">
                                <div class="card-body" style="height:250px;">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
                                <input type="text" class="form-control" placeholder="ค้นหา...พิมพ์ชื่องานที่นี้">
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
                              <div class="body-dasboard-right" style="overflow: auto;"> 

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

        if(w > 1024){
            $(".body-history").css({"height": h-100});
            $(".body-dasboard-right").css({"height": h-255});
            $(".b-left").css({"padding-right": "0px"});
            $(".b-right").css({"padding-left": "0px"});
        }
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
                        legend: {
                            display: true,
                            position: "bottom"
                        },
                        hover: {
                           animationDuration: 0
                         },
                         tooltipTemplate: "",

  showTooltips: true,

  onAnimationComplete: function() {
    this.showTooltip(this.datasets[0].points, true);
  },
  tooltipEvents: []
,
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
                            
        </script>