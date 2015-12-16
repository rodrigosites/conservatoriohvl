# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$(document).on 'ready page:load', (evt) ->
  		$('#data').mask('00/00/0000');

	$(document).on 'change', '#folhapagamento_mes', (evt) ->
		if $('#folhapagamento_mes option:selected').val().length
			if $('#folhapagamento_ano option:selected').val().length
				$('#button').prop("disabled", false );
		else
			$('#button').prop("disabled", true );

	$(document).on 'change', '#folhapagamento_ano', (evt) ->
		if $('#folhapagamento_ano option:selected').val().length
			if $('#folhapagamento_mes option:selected').val().length
				$('#button').prop("disabled", false );
		else
			$('#button').prop("disabled", true );

	$(document).on 'click', '#button', (evt) ->
		$.ajax
			  url: "/visualiza_folha"
			  type: "GET"
			  dataType: "script"
			  data:
			    mes: $('#folhapagamento_mes option:selected').val()
			    ano: $('#folhapagamento_ano option:selected').val()