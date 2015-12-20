(function() {
  'use strict';

  angular
    .module('gemfileio')
    .service('usersService', usersService);

  usersService.$inject = ['$rootScope', '$auth', '$location', 'notificationsFactory'];

  function usersService($rootScope, $auth, $location, notificationsFactory) {
    return {
      isAuthenticated: function() {
        return $auth.isAuthenticated();
      },
      authenticate: function(provider) {
        $auth.authenticate(provider).then(function() {
          notificationsFactory.add('Hello');
        }).catch(function(response) {
          notificationsFactory.add('Something went wrong');
        });
      },
      logout: function() {
        $auth.logout();
        delete $rootScope.currentUser;
        $location.path('/');
        notificationsFactory.add('Bye');
      }
  };
  }
})();
