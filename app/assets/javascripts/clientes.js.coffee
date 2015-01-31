# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', (evt) ->
  $('#cliente_rg').mask('ZZ.ZZZ.ZZZ.ZZZ.ZZZ-Z', {reverse: true, translation: {Z: {pattern: /[A-Za-z0-9]/}}});
  $('#cliente_cpf').mask('000.000.000-00', {reverse: true});
  $('#cliente_telefone').mask('(00) 0000-0000');
  $('#cliente_celular').mask('(00) 00000-0000');
  $('#cliente_cep').mask('00000-000');
  $('#cliente_uf').mask('AA');
  $('#cliente_nascimento').mask('00/00/0000');