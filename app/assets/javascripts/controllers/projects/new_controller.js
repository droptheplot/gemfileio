(function() {
  'use strict';

  angular
    .module('gemfileio')
    .controller('projectsNewController', projectsNewController);

  projectsNewController.$inject = ['$scope', 'projectsFactory', 'categoriesFactory', '$location', 'notificationsFactory'];

  function projectsNewController($scope, projectsFactory, categoriesFactory, $location, notificationsFactory) {
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
