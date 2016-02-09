# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$(document).on 'ready page:load', (evt) ->
  		$('#diferenciado_horario').mask('00:00');
  		$('#diferenciado_horario').hide();

	$(document).on 'change', '#diferenciado_check', (evt) ->
		if $('#diferenciado_check').prop('checked')
			$("option:selected").prop("selected", false);
			$('#horario_horario').prop("disabled", true );
			$('#horario_div').hide();
			$('#diferenciado_horario').show();
		else
			$('#horario_horario').prop("disabled", false );
			$('#horario_div').show();
			$('#diferenciado_horario').hide();