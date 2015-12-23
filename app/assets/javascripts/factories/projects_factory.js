(function() {
  'use strict';

  angular
    .module('gemfileio')
    .factory('projectsFactory', projectsFactory);

  projectsFactory.$inject = ['$resource'];

  function projectsFactory($resource) {
    var projects = $resource('/api/v1/projects/:id', {
      id: '@id',
      page: '@page',
      query: '@query',
      active: '@active'
    }, {
      'update': { method: 'PUT' },
      'create': { method: 'POST' }
    });

    projects.save = function(resource, success, error) {
      if(resource.id) {
        return this.update(resource, success, error);
      } else {
        return this.create(resource, success, error);
      }
    };

    return projects;
  }
})();
