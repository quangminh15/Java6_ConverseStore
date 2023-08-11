app.controller("reportfavorite-ctrl", function($scope, $http){
    $scope.items = [];
    $scope.initialize = function(){
        // Load data from API
        $http.get("/rest/favorite/top3").then(resp => {
            $scope.items = resp.data;
            drawChart();
        });
    };

    // Function to draw the Google Charts bar chart
    function drawChart() {
        google.charts.load('current', {'packages':['bar']});
        google.charts.setOnLoadCallback(function() {
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Product');
            data.addColumn('number', 'Tổng Lượt Thích');

            // Convert data to the format suitable for the chart
            $scope.items.forEach(item => {
                data.addRow([item[1], item[2]]);
            });

            var options = {
                width: 800,
                legend: { position: 'none' },
                chart: {
                    title: 'Sản Phẩm Được Yêu Thích',
                    subtitle: 'Tổng Số Lượt Yêu Thích Của Sản Phẩm'
                },
                axes: {
                    x: {
                        0: { side: 'top', label: 'Sản Phẩm' } // Top x-axis.
                    }
                },
                bar: { groupWidth: '90%' }
            };

            var chart = new google.charts.Bar(document.getElementById('top_x_div'));
            chart.draw(data, google.charts.Bar.convertOptions(options));
        });
    }

    $scope.initialize();
});
