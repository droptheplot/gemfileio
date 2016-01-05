(function() {
  'use strict';

  angular
    .module('gemfileio')
    .factory('statisticsFactory', statisticsFactory);

  statisticsFactory.$inject = ['$resource'];

  function statisticsFactory($resource) {
    return $resource('/api/v1/statistics/:id');
  }
})();
