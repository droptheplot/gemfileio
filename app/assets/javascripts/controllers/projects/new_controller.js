(function() {
  'use strict';

  angular
    .module('gemfileio')
    .controller('projectsNewController', projectsNewController);

  projectsNewController.$inject = ['$scope', 'projectsFactory', 'categoriesFactory', '$location'];

  function projectsNewController($scope, projectsFactory, categoriesFactory, $location) {
    categoriesFactory.query({}, function(data) {
      $scope.categories = data;
    });

    $scope.submitProject = function(project) {
      projectsFactory.save(project, function(data) {
        $location.path('/');
      }, function(data) {

      });
    };
  }
})();
