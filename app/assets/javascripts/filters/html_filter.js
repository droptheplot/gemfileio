angular
  .module('gemfileio')
  .filter('html', html);

html.$inject = ['$sce'];

function html($sce) {
  return function(input) {
    return $sce.trustAsHtml(input);
  }
}
