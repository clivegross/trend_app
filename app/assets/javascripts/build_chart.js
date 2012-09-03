$(function () {
  var chart;
  $(document).ready(function() {
    chart = new Highcharts.Chart({
      chart: {
        renderTo: 'container',
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