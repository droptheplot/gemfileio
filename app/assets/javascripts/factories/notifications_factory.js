(function() {
  'use strict';

  angular
    .module('gemfileio')
    .factory('notificationsFactory', notificationsFactory);

  notificationsFactory.$inject = ['$timeout'];

  function notificationsFactory($timeout) {
    var notifications = { list: [] };

    notifications.add = function(notification){
      notifications.list.push(notification);

      $timeout(function() {
        notifications.list.shift();
      }, 5000);
    };

    return notifications;
  }
})();
