(function() {
  'use strict';

  angular
    .module('gemfileio')
    .factory('categoriesFactory', categoriesFactory);

  categoriesFactory.$inject = ['$resource'];

  function categoriesFactory($resource) {
    return $resource('/api/v1/categories/:id', { id: '@id', category_id: '@category_id' }, {});
  }
})();
