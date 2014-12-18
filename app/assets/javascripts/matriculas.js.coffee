# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Acompanha a mudança dos selects e faz requisições Ajax para preenchimento dinâmico.

$ ->
	$(document).on 'change', '#matricula_curso_id', (evt) ->
		if $('#matricula_curso_id option:selected').val().length
			$.ajax
			  url: "/matriculas/busca_professores"
			  type: "GET"
			  dataType: "script"
			  data:
			    curso_id: $('#matricula_curso_id option:selected').val()
		else
			$('#professor_id').empty();
			$('#professor_id').append( $('<option value>Primeiro selecione o curso...</option>'));

	$(document).on 'change', '#matricula_curso_id', (evt) ->
		if $('#matricula_curso_id option:selected').val().length
			$.ajax
			  url: "/matriculas/busca_dados_curso"
			  type: "GET"
			  dataType: "script"
			  data:
			    curso_id: $('#matricula_curso_id option:selected').val()

	$(document).on 'change', '#professor_id', (evt) ->
		if $('#professor_id option:selected').val().length
			$.ajax
			  url: "/matriculas/busca_horarios"
			  type: "GET"
			  dataType: "script"
			  data:
			    professor_id: $('#professor_id option:selected').val()
			    curso_id: $('#matricula_curso_id option:selected').val()
		else
			$('#pratica_horario_id').empty();
			$('#pratica_horario_id').append( $('<option value>Primeiro selecione o professor...</option>'));

	$(document).on 'change', '#professor_teoria_id', (evt) ->
		if $('#professor_teoria_id option:selected').val().length
			$.ajax
			  url: "/matriculas/busca_horarios_teoria"
			  type: "GET"
			  dataType: "script"
			  data:
			    professor_id: $('#professor_teoria_id option:selected').val()
		else
			$('#teorica_horario_id').empty();
			$('#teorica_horario_id').append( $('<option value>Primeiro selecione o professor de teoria...</option>'));