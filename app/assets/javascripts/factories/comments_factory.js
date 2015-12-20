(function() {
  'use strict';

  angular
    .module('gemfileio')
    .factory('commentsFactory', commentsFactory);

  commentsFactory.$inject = ['$resource'];

  function commentsFactory($resource) {
    return $resource('/api/v1/comments/:id', { id: '@id', project_id: '@project_id' }, {});
  }
})();
