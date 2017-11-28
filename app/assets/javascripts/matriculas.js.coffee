# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Acompanha a mudança dos selects e faz requisições Ajax para preenchimento dinâmico.

$ ->
	valor_normal = 0

	# controla as mudanças no <select> Curso e reflete no <select> Professor.
	$(document).on 'change', '#matricula_curso_id', (evt) ->
		if $('#matricula_curso_id option:selected').val().length
			$.ajax
			  url: "/matriculas/busca_professores"
			  type: "GET"
			  dataType: "script"
			  data:
			    curso_id: $('#matricula_curso_id option:selected').val()
			$('#pratica_horario_id').empty();
			$('#pratica_horario_id').append($('<option value>Primeiro selecione o professor...</option>'));
		else
			$('#professor_id').empty();
			$('#professor_id').append($('<option value>Primeiro selecione o curso...</option>'));

	# controla as mudanças no <select> Curso e reflete nos <text> do curso.
	$(document).on 'change', '#matricula_curso_id', (evt) ->
		if $('#matricula_curso_id option:selected').val().length
			$.ajax
			  url: "/matriculas/busca_dados_curso"
			  type: "GET"
			  dataType: "script"
			  data:
			    curso_id: $('#matricula_curso_id option:selected').val()

	# controla as mudanças no <select> Tipo de Teoria e reflete no <select> Professor de Teoria.
	$(document).on 'change', '#tipo_teoria', (evt) ->
		if $('#tipo_teoria option:selected').val().length
			$.ajax
			  url: "/matriculas/tipo_teoria"
			  type: "GET"
			  dataType: "script"
			  data:
			    tipo_teoria: $('#tipo_teoria option:selected').val()
			$('#teorica_teoria').val($('#tipo_teoria option:selected').val())
		else
			$('#professor_teoria_id').empty();
			$('#professor_teoria_id').append($('<option value>Primeiro selecione o professor...</option>'));
			$('#matricula_teoria_ano').empty();
			$('#matricula_teoria_ano').append($('<option value>Selecione o tipo de teoria...</option>'));
			$('#professor_teoria_div').show()
			$('#horario_teoria_div').show()

	# controla as mudanças no <select> Curso e caso :selected seja referente a um curso de teoria, esconde os campos de teoria
	$(document).on 'change', '#matricula_curso_id', (evt) ->
		if ($.trim($('#matricula_curso_id option:selected').text()) == 'Teoria' || $.trim($('#matricula_curso_id option:selected').text()) == 'Musicalização Infantil') 
			$('#matricula_teoria_div').hide()
			$('#professor_teoria_div').hide()
			$('#horario_teoria_div').hide()
			$('#tipo_teoria_div').hide()
			$('#matricula_teoria_ano').append($('<option value=99>99</option>'))
			$('#matricula_teoria_ano').val(99)
		else
			$('#matricula_teoria_div').show()
			$('#professor_teoria_div').show()
			$('#horario_teoria_div').show()
			$('#tipo_teoria_div').show()

	# controla as mudanças no <select> Professor e reflete no <select> Horários do Professor.
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

	# controla as mudanças no <select> Professor Teoria e reflete no <select> Horários do Professor Teoria.
	$(document).on 'change', '#professor_teoria_id', (evt) ->
		if $('#professor_teoria_id option:selected').val().length
			$.ajax
			  url: "/matriculas/busca_horarios_teoria"
			  type: "GET"
			  dataType: "script"
			  data:
			    professor_id: $('#professor_teoria_id option:selected').val()
			    tipo_teoria: $('#tipo_teoria option:selected').val()
		else
			$('#teorica_horario_id').empty();
			$('#teorica_horario_id').append( $('<option value>Primeiro selecione o professor de teoria...</option>'));

	# controla as mudanças no <select> Ano Teoria e esconde os campos de teoria caso o aluno seja formado em teoria.
	$(document).on 'change', '#matricula_teoria_ano', (evt) ->
		if $.trim($('#matricula_teoria_ano option:selected').text()) == 'Formado em Teoria'
			$('#professor_teoria_div').hide()
			$('#horario_teoria_div').hide()
		else
			$('#professor_teoria_div').show()
			$('#horario_teoria_div').show()

	# controla o clique no botão de desconto.
	$(document).on 'change', '#desconto_check', (evt) ->
		if $('#desconto_check').prop('checked')
			valor_normal = $('#matricula_valor_mensal').val()
			valor_desconto = $('#matricula_valor_mensal').val() - $('#matricula_desconto').val()
			$('#matricula_valor_mensal').val(valor_desconto)
		else
			$('#matricula_valor_mensal').val(valor_normal)

	# controla o clique no botão de destravar campo valor.
	$(document).on 'change', '#destrava_valor', (evt) ->
		if $('#destrava_valor').prop('checked')
			$('#matricula_valor_mensal').prop('readonly', false)
		else
			$('#matricula_valor_mensal').prop('readonly', true)

	# aplica as máscaras dos campos.
	$(document).on 'ready page:load', (evt) ->
		$('#matricula_curso_id').val('')

	# aplica as máscaras dos campos.
	$(document).on 'ready page:load', (evt) ->
  		$('#matricula_data_matricula').mask('00/00/0000');
  		$('input[id^="encerrada"]').mask('00/00/0000');

  	# alterar data de encerramento das matriculas
  	$(document).on 'click', 'button[id^="encerrada"]', (evt) ->
  		$.ajax
  			url: "/altera_encerramento"
  			type: "GET"
  			data:
  				id: this.name
  				nova_data: $("#encerrada_" + this.name).val()
  		alert('Alterado com sucesso.')