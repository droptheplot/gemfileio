(function() {
  'use strict';

  angular
    .module('gemfileio')
    .controller('projectsShowController', projectsShowController);

  projectsShowController.$inject = ['$scope', 'projectsFactory', 'commentsFactory', 'usersService'];

  function projectsShowController($scope, projectsFactory, commentsFactory, usersService) {
    $scope.isAuthenticated = usersService.isAuthenticated;
    $scope.authenticate = usersService.authenticate;

    $scope.project = {};
    $scope.comments = [];

    projectsFactory.get({ id: $scope.ngDialogData.projectId }, function(data) {
      $scope.project = data;
    });

    $scope.toggleFavorite = function() {
      projectsFactory.toggleFavorite({ id: $scope.ngDialogData.projectId }, function(data) {
        $scope.project = data;
      });
    };

    $scope.submitComment = function(body) {
      var comment = {
        project_id: $scope.project.id,
        body: body
      };

      commentsFactory.save(comment, function(data) {
        $scope.project.comments.push(data);

        delete self.comment;
        delete $scope.body;
      });
    };
  }
})();
