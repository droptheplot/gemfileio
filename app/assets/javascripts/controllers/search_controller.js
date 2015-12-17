(function() {
  'use strict';

  angular
    .module('gemfileio')
    .controller('searchController', searchController);

  searchController.$inject = ['$scope', '$location', '$routeParams'];

  function searchController($scope, $location, $routeParams) {
    $scope.$on('$locationChangeSuccess', function() {
      if($location.search().query !== '') {
        $scope.query = $location.search().query;
      } else {
        delete $scope.query;
        $location.search('query', null);
      }
    });

    $scope.setQuery = function(query) {
      $location.search({ query: query });
    };
  }
})();
