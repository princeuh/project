# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
			$('.investor-bttn-options').click ->
				$('.allOptions').hide()
				$('.investor-bttn-options').css("background-color", "#572C7A")
				$('.investor-bttn-options').css("color", "#C7E1F5")
				if @id == 'show-myClubs'
					$('#investor-myClubs').show()
					$(this).css("background-color", "#361d4e")
					$(this).css("color", "#E04398")
				else if @id == 'show-allClubs'
					$('#investor-allClubs').show()
					$(this).css("background-color", "#361d4e")
					$(this).css("color", "#E04398")
				else if @id == 'show-proposal'
					$('#investor-proposal').show()
					$(this).css("background-color", "#361d4e")
					$(this).css("color", "#E04398")
				else if @id == 'show-account'
					$('#investor-account').show()
					$(this).css("background-color", "#361d4e")
					$(this).css("color", "#E04398")
				else if @id == "profile"
					$('#investor-updates').show()
					$(this).css("background-color", "#361d4e")
					$(this).css("color", "#E04398")
				else if @id == "show-news"
					$('#investor-news').show()
					$(this).css("background-color", "#361d4e")
					$(this).css("color", "#E04398")