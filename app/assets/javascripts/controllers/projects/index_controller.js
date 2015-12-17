(function() {
  'use strict';

  angular
    .module('gemfileio')
    .controller('projectsIndexController', projectsIndexController);

  projectsIndexController.$inject = ['$scope', 'projectsFactory', '$routeParams'];

  function projectsIndexController($scope, projectsFactory, $routeParams) {
    $scope.page = 1;

    projectsFactory.query({ page: $scope.page, category_id: $routeParams.id }, function(data) {
      $scope.projects = data;
    });
  }
})();
