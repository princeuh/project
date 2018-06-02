# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on "turbolinks:load", ->
				$('#careers-apply').click -> 
					$('.check-application').fadeIn(500)

				$('.close').click ->
					$('.check-application').fadeOut(500)