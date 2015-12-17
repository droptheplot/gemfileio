(function() {
  'use strict';

  angular
    .module('gemfileio')
    .controller('categoriesController', categoriesController);

  categoriesController.$inject = ['$scope', 'categoriesFactory'];

  function categoriesController($scope, categoriesFactory) {
    categoriesFactory.query({}, function(data) {
      $scope.categories = data;
    });

    $scope.$on('$routeChangeSuccess', function(event, current, previous) {
      if(current.params.category_id) {
        $scope.activeCategoryId = current.params.category_id;
      } else {
        delete $scope.activeCategoryId;
      }
    });
  }
})();
