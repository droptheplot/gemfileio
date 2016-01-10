(function() {
  'use strict';

  angular
    .module('gemfileio')
    .controller('statisticsController', statisticsController);

  statisticsController.$inject = ['$scope', '$rootScope', 'statisticsFactory'];

  function statisticsController($scope, $rootScope, statisticsFactory) {
    $scope.statistics = {
      options: $rootScope.chartjs_defaults.options,
      colours: $rootScope.chartjs_defaults.colours,
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
