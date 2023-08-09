    google.charts.load('current', {'packages':['bar']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
      // Thay đổi dữ liệu trong biến chartData tương ứng với dữ liệu từ backend
      var chartData = [
        ['Converse 01', 4],
        ['Converse 02', 3],
        ['Converse 04', 1]
        // Thêm các dòng dữ liệu khác nếu cần
      ];

      var data = new google.visualization.arrayToDataTable([
        ['Product', 'Total Likes'],
        ...chartData
      ]);

      var options = {
        width: 800,
        legend: { position: 'none' },
        chart: {
          title: 'Favorite Product Likes',
          subtitle: 'Total Likes by Product'
        },
        axes: {
          x: {
            0: { side: 'top', label: 'Product' } // Top x-axis.
          }
        },
        bar: { groupWidth: '90%' }
      };

      var chart = new google.charts.Bar(document.getElementById('top_x_div'));
      chart.draw(data, google.charts.Bar.convertOptions(options));
    }