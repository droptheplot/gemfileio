(function() {
  'use strict';

  angular
    .module('gemfileio')
    .factory('projectsFactory', projectsFactory);

  projectsFactory.$inject = ['$resource'];

  function projectsFactory($resource) {
    return $resource('/api/v1/projects/:id', { id: '@id', page: '@page', query: '@query' }, {});
  }
})();
