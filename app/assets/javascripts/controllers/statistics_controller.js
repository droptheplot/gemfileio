(function() {
  'use strict';

  angular
    .module('gemfileio')
    .controller('statisticsController', statisticsController);

  statisticsController.$inject = ['$scope', 'statisticsFactory'];

  function statisticsController($scope, statisticsFactory) {
    $scope.statistics = {
      options: {
        responsive: true,
        maintainAspectRatio: false,
        showTooltips: false,
        pointDot: false,
        scaleFontSize: 8,
        scaleFontColor: '#888'
      },
      colours: [{
        fillColor: 'rgba(199, 44, 28, 0.2)',
        strokeColor: 'rgba(199, 44, 28, 0.3)'
      }, {
        fillColor: 'rgba(199, 44, 28, 0.2)',
        strokeColor: 'rgba(199, 44, 28, 0.3)'
      }],
      series: ['Active Projects'],
      labels: [],
      data: [[]]
    };

    statisticsFactory.query({}, function(data) {
      data.forEach(function(element, index) {
        if(index % 2 === 0) {
          $scope.statistics.labels.push('');
        } else {
          $scope.statistics.labels.push(moment(element.created_at).format('D MMM'));
        }

        $scope.statistics.data[0].push(element.active_projects_count);
      });
    });
  }
})();
