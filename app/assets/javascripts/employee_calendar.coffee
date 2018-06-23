# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on "turbolinks:load", ->	
	$('.mon').click ->
		if @id == 'jan'
			$('#months').hide()
			$('#display-month').fadeIn(500)
			$('#january').show()
		else if @id == 'feb'
			$('#months').hide()
			$('#display-month').fadeIn(500)
			$('#february').show()
		else if @id == 'mar'
			$('#months').hide()
			$('#display-month').fadeIn(500)
			$('#march').show()
		else if @id == 'apr'
			$('#months').hide()
			$('#display-month').fadeIn(500)
			$('#april').show()
		else if @id == 'may'
			$('#months').hide()
			$('#display-month').fadeIn(500)
			$('#may').show()
		else if @id == 'jun'
			$('#months').hide()
			$('#display-month').fadeIn(500)
			$('#june').show()
		else if @id == 'jul'
			$('#months').hide()
			$('#display-month').fadeIn(500)
			$('#july').show()
		else if @id == 'aug'
			$('#months').hide()
			$('#display-month').fadeIn(500)
			$('#august').show()
		else if @id == 'sept'
			$('#months').hide()
			$('#display-month').fadeIn(500)
			$('#september').show()
		else if @id == 'oct'
			$('#months').hide()
			$('#display-month').fadeIn(500)
			$('#october').show()
		else if @id == 'nov'
			$('#months').hide()
			$('#display-month').fadeIn(500)
			$('#november').show()
		else if @id == 'dec'
			$('#months').hide()
			$('#display-month').fadeIn(500)
			$('#december').show()

			
		
