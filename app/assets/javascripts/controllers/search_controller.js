(function() {
  'use strict';

  angular
    .module('gemfileio')
    .controller('searchController', searchController);

  searchController.$inject = ['$scope', '$location', '$routeParams'];

  function searchController($scope, $location, $routeParams) {
    $scope.$on('$locationChangeSuccess', function() {
      $scope.query = $location.search().query;
    });

    $scope.setQuery = function(query) {
      $location.search({ query: query });
    };
  }
})();
