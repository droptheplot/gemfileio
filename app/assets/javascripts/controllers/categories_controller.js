(function() {
  'use strict';

  angular
    .module('gemfileio')
    .controller('categoriesController', categoriesController);

  categoriesController.$inject = ['$scope', '$location', 'categoriesFactory'];

  function categoriesController($scope, $location, categoriesFactory) {
    categoriesFactory.query({}, function(data) {
      $scope.categories = data;
    });

    $scope.showCategory = function(category) {
      if(category.id === $scope.showCategoryId) {
        delete $scope.showCategoryId;
        return;
      }

      if(category.subcategories.length > 0) {
        $scope.showCategoryId = category.id;
      } else {
        $location.path('/categories/' + category.id);
      }
    };

    $scope.$on('$routeChangeSuccess', function(event, current, previous) {
      if(current.params.category_id) {
        $scope.activeCategoryId = current.params.category_id;
      } else {
        delete $scope.activeCategoryId;
      }
    });
  }
})();
