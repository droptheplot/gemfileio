(function() {
  'use strict';

  angular
    .module('gemfileio')
    .controller('projectsShowController', projectsShowController);

  projectsShowController.$inject = ['$scope', 'projectsFactory', 'commentsFactory', 'usersService', 'notificationsFactory'];

  function projectsShowController($scope, projectsFactory, commentsFactory, usersService, notificationsFactory) {
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

        if($scope.project.favorited_by_current_user) {
          notificationsFactory.add('Added to favorites');
        } else {
          notificationsFactory.add('Removed from favorites');
        }
      });
    };

    $scope.submitComment = function(body) {
      var comment = {
        project_id: $scope.project.id,
        body: body
      };

      commentsFactory.save(comment, function(data) {
        $scope.project.comments.push(data);
        notificationsFactory.add('Comment added');

        delete self.comment;
        delete $scope.body;
      });
    };
  }
})();
