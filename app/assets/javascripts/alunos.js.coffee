# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Máscaras dos campos, utilizando plugin JQuery Masks
$(document).on 'ready page:load', (evt) ->
  $('#aluno_rg').mask('00.000.000-0', {reverse: true});
  $('#aluno_cpf').mask('000.000.000-00', {reverse: true});
  $('#aluno_telefone').mask('(00) 0000-0000');
  $('#aluno_celular').mask('(00) 00000-0000');

# Monitora o checkbox e requisita via Ajax os dados do cliente selecionado no select
$(document).on 'change', '#aluno_cliente', (evt) ->
	if $('#aluno_cliente').prop('checked')
		$.ajax
			  url: "/aluno/busca_dados_cliente"
			  type: "GET"
			  dataType: "script"
			  data:
			    cliente_id: $('#aluno_cliente_id option:selected').val()
	else
		$('#aluno_nome').val('')
		$('#aluno_endereco').val('')
		$('#aluno_rg').val('')
		$('#aluno_cpf').val('')
		$('#aluno_telefone').val('')
		$('#aluno_celular').val('')
		$('#aluno_bairro').val('')
		$('#aluno_cidade').val('')
		$('#aluno_uf').val('')
		$('#aluno_cep').val('')
		$('#aluno_email').val('')
		$('#aluno_nascimento').val('')
		$('#aluno_nacionalidade').val('')
		$('#aluno_pai').val('')
		$('#aluno_mae').val('')
		$('#aluno_profissao').val('')
