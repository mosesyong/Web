<html>
    <head>
        Trial Page
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js'></script>
    <body>
        <div class="content">
            <div id="trialChart">
                <canvas id="trialPie"></canvas>
            </div>
            <script>
                console.log("In.")
                var ctx = document.getElementById('trialPie').getContext('2d');
                var trialPie = new Chart(ctx,{
                    type:'pie',
                    data: {
                        labels:["grapes","oranges", "apples", "pineapples"],
                        datasets:[{
                                label:'Quantity',
                                data:[2.4,3.6,4.0,5.18],
                                backgroundColor:'#FFC925'  
                            }]
                        },
                        options:{
                            legend:{
                                display: true
                            },
                            scaleShowValues:true,
                            scales:{
                                yAxes: [{
                                    ticks:{
                                        beginAtZero:true
                                    }
                                }],
                                xAxes: [{
                                    ticks:{
                                        autoSkip:false
                                    }
                                }]
                            },
                            responsive: true,
                            maintainAspectRatio: false
                        }
                    }     
                );
            </script>   
        </div>
 
    </body>
</html>
