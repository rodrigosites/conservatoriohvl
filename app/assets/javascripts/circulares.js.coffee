# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Máscaras dos campos, utilizando plugin JQuery Masks
$(document).on 'ready page:load', (evt) ->
  $('#circular_numero_circular').mask('000/0000');
  $('#circular_data_circular').mask('00/00/0000');
  $('#circular_valor_mensalidade').mask('099,00');
  $('#circular_valor_extra').mask('099,00');
  $('#circular_taxa_matricula').mask('099,00');