(function() {
  'use strict';

  angular
    .module('gemfileio')
    .controller('projectsIndexController', projectsIndexController);

  projectsIndexController.$inject = ['$scope', 'projectsFactory', 'categoriesFactory', '$routeParams'];

  function projectsIndexController($scope, projectsFactory, categoriesFactory, $routeParams) {
    $scope.projects = [];
    $scope.page = 1;

    $scope.loadProjects = function() {
      projectsFactory.query({ page: $scope.page, category_id: $routeParams.category_id, query: $routeParams.query }, function(data) {
        $scope.projects = $scope.projects.concat(data);
        $scope.page += 1;
      });
    };

    if($routeParams.category_id) {
      categoriesFactory.get({ id: $routeParams.category_id }, function(data) {
        $scope.category = data;
      });
    }

    $scope.loadProjects();
  }
})();
