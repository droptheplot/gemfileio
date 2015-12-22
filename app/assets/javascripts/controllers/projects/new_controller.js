(function() {
  'use strict';

  angular
    .module('gemfileio')
    .controller('projectsNewController', projectsNewController);

  projectsNewController.$inject = ['$scope', '$rootScope', 'projectsFactory', 'categoriesFactory', '$location', 'notificationsFactory'];

  function projectsNewController($scope, $rootScope, projectsFactory, categoriesFactory, $location, notificationsFactory) {
    $scope.project = {};

    categoriesFactory.query({}, function(data) {
      $scope.categories = data;
      $scope.project.category_id = $scope.categories[0].id;
    });

    $scope.submitProject = function(project) {
      if($rootScope.currentUser.admin) {
        project.active = true;
      }
      console.log(project)

      projectsFactory.save(project, function(data) {
        $location.path('/');
        notificationsFactory.add('Thanks!');
      }, function(data) {
        notificationsFactory.add(data.data[0]);
      });
    };
  }
})();
