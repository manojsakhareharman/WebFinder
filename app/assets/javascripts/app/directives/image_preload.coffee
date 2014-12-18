angular.module('HarmanPro')
  .directive 'imgPreload', ->
    {
      restrict: 'A'
      scope: { ngSrc: '@' }
      link: (scope, element) ->
        element.on 'load', ->
          element.parent().find('span').remove()
          element.animate { opacity: 1 }
        scope.$watch 'ngSrc', ->
          element.parent().append('<span class="spinner"></span>')
          element.css { opacity: 0 }
    }

