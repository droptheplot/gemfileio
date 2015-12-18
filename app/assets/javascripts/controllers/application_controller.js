(function() {
  'use strict';

  angular
    .module('gemfileio')
    .controller('applicationController', applicationController);

  applicationController.$inject = ['$scope', '$rootScope', '$auth', '$location'];

  function applicationController($scope, $rootScope, $auth, $location) {
    if($auth.isAuthenticated()) {
      $rootScope.currentUser = $auth.getPayload();;
    }

    $scope.isAuthenticated = function() {
      return $auth.isAuthenticated();
    };

    $scope.authenticate = function(provider) {
      $auth.authenticate(provider);
    };

    $scope.logout = function() {
      $auth.logout();
      delete $rootScope.currentUser;
      $location.path('/');
    };
  }
})();
