$(function () {
  var chart;
  $(document).ready(function() {
    chart = new Highcharts.Chart({
      chart: {
        renderTo: 'chart',
        zoomType: 'x',
        spacingRight: 20
      },
      title: {
        text: 'Stock Price Over Past Year'
      },
      xAxis: {
        type: "datetime", 
      },
      yAxis: {
        title: {
          text: 'Price ($)'
          },
        max: y_max_j,
        min: y_min_j
      },
      plotOptions: {
        line: {
          marker: {
            enabled: false,
            states: {
              hover: {
                enabled: true,
                  radius: 5
              }
            }
          }
        },
        area: {
          marker: {
            enabled: false,
            states: {
              hover: {
                enabled: true,
                  radius: 5
              }
            }
          }
        }
      },
      series: [{
        name: 'Closing Price',
        type: 'area',
        data: close_array_j
      }, {
        name: '20 Day Moving Average',
        data: avg_array_j
      }]
    });
  });    
});