# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
# Visualiza Folha de Pagamento
	$(document).on 'change', '#folhapagamento_mes', (evt) ->
		if $('#folhapagamento_mes option:selected').val().length
			if $('#folhapagamento_ano option:selected').val().length
				$('#folha_button').prop("disabled", false );
		else
			$('#folha_button').prop("disabled", true );

	$(document).on 'change', '#folhapagamento_ano', (evt) ->
		if $('#folhapagamento_ano option:selected').val().length
			if $('#folhapagamento_mes option:selected').val().length
				$('#folha_button').prop("disabled", false );
		else
			$('#folha_button').prop("disabled", true );

	$(document).on 'click', '#folha_button', (evt) ->
		$.ajax
			  url: "/visualiza_folha"
			  type: "GET"
			  dataType: "script"
			  data:
			    mes: $('#folhapagamento_mes option:selected').val()
			    ano: $('#folhapagamento_ano option:selected').val()

# Visualiza Boletos por Cliente
	$(document).on 'change', '#valorboleto_mes', (evt) ->
		if $('#valorboleto_mes option:selected').val().length
			if $('#valorboleto_ano option:selected').val().length
				$('#boletos_button').prop("disabled", false );
		else
			$('#boletos_button').prop("disabled", true );

	$(document).on 'change', '#valorboleto_ano', (evt) ->
		if $('#valorboleto_ano option:selected').val().length
			if $('#valorboleto_mes option:selected').val().length
				$('#boletos_button').prop("disabled", false );
		else
			$('#boletos_button').prop("disabled", true );

		$(document).on 'click', '#boletos_button', (evt) ->
			$.ajax
				  url: "/visualiza_boletos"
				  type: "GET"
				  dataType: "script"
				  data:
				    mes: $('#valorboleto_mes option:selected').val()
				    ano: $('#valorboleto_ano option:selected').val()

# Esconde/mostra linha dos alunos de cada professor
	$(document).on 'click', 'button', (evt) ->
		$('table.table-striped tr').filter(".professor" + this.value).toggle();