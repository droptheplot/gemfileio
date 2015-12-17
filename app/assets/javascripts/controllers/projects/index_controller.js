(function() {
  'use strict';

  angular
    .module('gemfileio')
    .controller('projectsIndexController', projectsIndexController);

  projectsIndexController.$inject = ['$scope', 'projectsFactory', '$routeParams'];

  function projectsIndexController($scope, projectsFactory, $routeParams) {
    $scope.projects = [];
    $scope.page = 1;

    $scope.loadProjects = function() {
      projectsFactory.query({ page: $scope.page, category_id: $routeParams.id, query: $routeParams.query }, function(data) {
        $scope.projects = $scope.projects.concat(data);
        $scope.page += 1;
      });
    };

    $scope.loadProjects();
  }
})();
