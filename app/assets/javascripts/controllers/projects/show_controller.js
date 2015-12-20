(function() {
  'use strict';

  angular
    .module('gemfileio')
    .controller('projectsShowController', projectsShowController);

  projectsShowController.$inject = ['$scope', 'projectsFactory'];

  function projectsShowController($scope, projectsFactory) {
    projectsFactory.get({ id: $scope.ngDialogData.projectId }, function(data) {
      $scope.project = data;
    });
  }
})();
