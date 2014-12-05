# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	professores = $('#classe_professor_id').html()
	$('#classe_professor_id').hide()
	horarios = $('#classe_horario_id').html()
	$('#classe_horario_id').hide()
	$(document).on 'change', '#classe_curso_id', (evt) ->
		curso = $('#classe_curso_id :selected').text()
		options_professores = $(professores).filter("optgroup[label='#{curso}']").html()
		if options_professores
			$('#classe_professor_id').html(options_professores)
			$("#classe_professor_id").append('<option selected></option>');
			$('#classe_professor_id').show()
		else
			$('#classe_professor_id').empty()
			$('#classe_professor_id').hide()
	
	$(document).on 'change', '#classe_professor_id', (evt) ->
		professor = $('#classe_professor_id :selected').text()
		options_horarios = $(horarios).filter("optgroup[label='#{professor}']").html()
		if options_horarios
			$('#classe_horario_id').html(options_horarios)
			$('#classe_horario_id').show()
		else
			$('#classe_horario_id').empty()
			$('#classe_horario_id').hide()