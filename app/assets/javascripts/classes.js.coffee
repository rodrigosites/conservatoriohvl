# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	professores = $('#classe_idprofessor').html()
	$('#classe_idcurso').change ->
		curso = $('#classe_idcurso :selected').text()
		options = $(professores).filter("optgroup[label='#{curso}']").html()
		if options
			$('#classe_idprofessor').html(options)
		else
			$('#classe_idprofessor').empty()