(function() {
  'use strict';

  angular
    .module('gemfileio')
    .controller('projectsShowController', projectsShowController);

  projectsShowController.$inject = ['$scope', '$rootScope', 'projectsFactory', 'commentsFactory', 'usersService', 'notificationsFactory'];

  function projectsShowController($scope, $rootScope, projectsFactory, commentsFactory, usersService, notificationsFactory) {
    $scope.isAuthenticated = usersService.isAuthenticated;
    $scope.authenticate = usersService.authenticate;

    $scope.project = {};
    $scope.comments = [];
    $scope.statistics = {
      options: $rootScope.chartjs_defaults.options,
      colours: $rootScope.chartjs_defaults.colours,
      series: ['Commits'],
      labels: [],
      data: []
    };

    projectsFactory.get({ id: $scope.ngDialogData.projectId }, function(data) {
      $scope.project = data;

      $scope.statistics.data[0] = $scope.project.commits_count;

      for(var i = 0; i < $scope.project.commits_count.length; i++) {
        $scope.statistics.labels.push('');
      }
    });

    $scope.toggleFavorite = function() {
      if(!$scope.isAuthenticated()) {
        return;
      }

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

    $scope.clipboardSuccess = function() {
      notificationsFactory.add('Copied to clipboard');
    };
  }
})();
