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
  }
})();
