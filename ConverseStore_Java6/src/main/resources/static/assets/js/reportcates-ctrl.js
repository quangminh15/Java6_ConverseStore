app.controller("reportcate-ctrl", function($scope, $http){
    $scope.items = [];
    $scope.initialize = function(){
        // Load data from API
        $http.get("/rest/revenues/doanhthuDM").then(resp => {
            $scope.items = resp.data;
            drawChart(); // Call the function to draw the chart
        });
    };

    // Function to draw the Google Charts bar chart
    function drawChart() {
        google.charts.load('current', {'packages':['bar']});
        google.charts.setOnLoadCallback(function() {
            var data = new google.visualization.DataTable();
    data.addColumn('string', 'Categories');
    data.addColumn('number', 'Doanh Thu');

    // Convert data to the format suitable for the chart
    $scope.items.forEach(item => {
        data.addRow([item[0], parseFloat(item[1])]); // Chỉnh số cột cần thiết
    });
            var options = {
                width: 800,
                legend: { position: 'none' },
                chart: {
                    title: 'Doanh thu của danh mục',
                    subtitle: 'Tổng doanh thu của từng danh mục'
                },
                axes: {
                    x: {
                        0: { side: 'top', label: 'Doanh Thu' } // Top x-axis.
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
