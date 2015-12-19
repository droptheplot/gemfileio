(function() {
  'use strict';

  angular
    .module('gemfileio')
    .controller('applicationController', applicationController);

  applicationController.$inject = ['$scope', '$rootScope', '$auth', '$location', 'notificationsFactory'];

  function applicationController($scope, $rootScope, $auth, $location, notificationsFactory) {
    $scope.notifications = notificationsFactory;

    if($auth.isAuthenticated()) {
      $rootScope.currentUser = $auth.getPayload().user;
    }

    $scope.isAuthenticated = function() {
      return $auth.isAuthenticated();
    };

    $scope.authenticate = function(provider) {
      $auth.authenticate(provider).then(function() {
        notificationsFactory.add('Hello');
      }).catch(function(response) {
        notificationsFactory.add('Something went wrong');
      });
    };

    $scope.logout = function() {
      $auth.logout();
      delete $rootScope.currentUser;
      $location.path('/');
      notificationsFactory.add('Bye');
    };
  }
})();
