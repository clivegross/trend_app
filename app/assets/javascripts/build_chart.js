$(function () {
  var chart;
  $(document).ready(function() {
    chart = new Highcharts.Chart({
      chart: {
          renderTo: 'container',
      },
      title: {
          text: 'Stock Price Over Past Year'
      },
      xAxis: {
          type: "datetime"
      },
      yAxis: {
          title: {
              text: 'Price ($)'
          }
      },
      series: [{
          name: 'Closing Price',
          data: [1, 3, 5, 4, 2]
      }]
    });
  });    
});