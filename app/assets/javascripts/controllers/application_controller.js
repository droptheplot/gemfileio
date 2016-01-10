(function() {
  'use strict';

  angular
    .module('gemfileio')
    .controller('applicationController', applicationController);

  applicationController.$inject = ['$scope', '$rootScope', '$auth', 'usersService', 'notificationsFactory'];

  function applicationController($scope, $rootScope, $auth, usersService, notificationsFactory) {
    $scope.notifications = notificationsFactory;

    $scope.$on('$routeChangeSuccess', function () {
      $rootScope.locationPathname = window.location.pathname;
    });

    $scope.isAuthenticated = usersService.isAuthenticated;
    $scope.authenticate = usersService.authenticate;
    $scope.logout = usersService.logout;

    if($auth.isAuthenticated()) {
      $rootScope.currentUser = $auth.getPayload().user;
    }

    $rootScope.chartjs_defaults = {
      options: {
        responsive: true,
        maintainAspectRatio: false,
        showTooltips: false,
        pointDot: false,
        scaleFontSize: 8,
        scaleFontColor: '#888'
      },
      colours: [{
        fillColor: 'rgba(199, 44, 28, 0.2)',
        strokeColor: 'rgba(199, 44, 28, 0.3)'
      }, {
        fillColor: 'rgba(199, 44, 28, 0.2)',
        strokeColor: 'rgba(199, 44, 28, 0.3)'
      }]
    }
  }
})();
