# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
		$('.emp-opts').click ->
			$('.empl-opts').hide()
			$('.emp-opts').css("background-color", "#572C7A")
			$('.emp-opts').css("color", "#7f60a9")
			if @id == 'emp-add'
				$(this).css("background-color", "#361d4e")
				$(this).css("color", "#E04398")
				$('#add-employee').show()
			else if @id == 'emp-clubs'
				$(this).css("background-color", "#361d4e")
				$(this).css("color", "#E04398")
				$('#show-clubs').show()
			else if @id == 'emp-users'
				$(this).css("background-color", "#361d4e")
				$(this).css("color", "#E04398")
				$('#show-investors').show()
			else if @id == 'emp-allEmp'
				$(this).css("background-color", "#361d4e")
				$(this).css("color", "#E04398")
				$('#show-employees').show()
			else if @id == 'emp-priviledges'
				$(this).css("background-color", "#361d4e")
				$(this).css("color", "#E04398")
				$('#show-priviledges').show()
			else if @id == 'emp-managers'
				$(this).css("background-color", "#361d4e")
				$(this).css("color", "#E04398")
				$('#show-managers').show()
			else if @id == 'emp-owners'
				$(this).css("background-color", "#361d4e")
				$(this).css("color", "#E04398")
				$('#show-owners').show()
			else if @id == 'emp-proposals'
				$(this).css("background-color", "#361d4e")
				$(this).css("color", "#E04398")
				$('#show-proposals').show()
			else if @id == 'emp-contacts'
				$(this).css("background-color", "#361d4e")
				$(this).css("color", "#E04398")
				$('#show-contacts').show()
			else if @id == 'emp-updates'
				$(this).css("background-color", "#361d4e")
				$(this).css("color", "#E04398")
				$('#show-updates').show()
			else if @id == 'emp-news'
				$(this).css("background-color", "#361d4e")
				$(this).css("color", "#E04398")
				$('#show-news').show()