(function() {
  'use strict';

  angular
    .module('gemfileio')
    .controller('projectsEditController', projectsEditController);

  projectsEditController.$inject = ['$scope', 'projectsFactory', 'categoriesFactory', '$location', 'notificationsFactory', '$routeParams'];

  function projectsEditController($scope, projectsFactory, categoriesFactory, $location, notificationsFactory, $routeParams) {
    projectsFactory.get({ id: $routeParams.project_id }, function(data) {
      $scope.project = data;
    });

    categoriesFactory.query({}, function(data) {
      $scope.categories = data;
    });

    $scope.submitProject = function(project) {
      projectsFactory.save(project, function(data) {
        $location.path('/');
        notificationsFactory.add('Thanks!');
      }, function(data) {
        notificationsFactory.add(data.data[0]);
      });
    };
  }
})();
