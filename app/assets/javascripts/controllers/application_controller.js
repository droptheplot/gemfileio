(function() {
  'use strict';

  angular
    .module('gemfileio')
    .controller('applicationController', applicationController);

  applicationController.$inject = ['$scope', '$rootScope', '$auth', 'usersService', 'notificationsFactory'];

  function applicationController($scope, $rootScope, $auth, usersService, notificationsFactory) {
    $scope.notifications = notificationsFactory;
    
    $scope.isAuthenticated = usersService.isAuthenticated;
    $scope.authenticate = usersService.authenticate;
    $scope.logout = usersService.logout;

    if($auth.isAuthenticated()) {
      $rootScope.currentUser = $auth.getPayload().user;
    }
  }
})();
