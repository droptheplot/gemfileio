(function() {
  'use strict';

  angular
    .module('gemfileio')
    .controller('projectsIndexController', projectsIndexController);

  projectsIndexController.$inject = ['$scope', 'projectsFactory'];

  function projectsIndexController($scope, projectsFactory) {
    $scope.page = 1;

    projectsFactory.query({ page: $scope.page }, function(data) {
      $scope.projects = data;
    });
  }
})();
