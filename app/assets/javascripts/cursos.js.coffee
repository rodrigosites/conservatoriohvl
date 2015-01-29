# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


# aplica as máscaras dos campos.
	$(document).on 'ready page:load', (evt) ->
  		$('#curso_valor').mask('099,00');