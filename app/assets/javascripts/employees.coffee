# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
		$('.emp-opts').click ->
			$('.empl-opts').hide()
			$('.emp-opts').css("color", "#7f60a9")
			if @id == 'emp-add'
				$(this).css("letter-spacing", "2px")
				$(this).css("color", "#4caf50")
				$('#add-employee').show()
			else if @id == 'emp-clubs'
				$(this).css("letter-spacing", "2px")
				$(this).css("color", "#4caf50")
				$('#show-clubs').show()
			else if @id == 'emp-users'
				$(this).css("letter-spacing", "2px")
				$(this).css("color", "#4caf50")
				$('#show-investors').show()
			else if @id == 'emp-allEmp'
				$(this).css("letter-spacing", "2px")
				$(this).css("color", "#4caf50")
				$('#show-employees').show()
			else if @id == 'emp-priviledges'
				$(this).css("letter-spacing", "2px")
				$(this).css("color", "#4caf50")
				$('#show-priviledges').show()
			else if @id == 'emp-managers'
				$(this).css("letter-spacing", "2px")
				$(this).css("color", "#4caf50")
				$('#show-managers').show()
			else if @id == 'emp-owners'
				$(this).css("letter-spacing", "2px")
				$(this).css("color", "#4caf50")
				$('#show-owners').show()
			else if @id == 'emp-proposals'
				$(this).css("letter-spacing", "2px")
				$(this).css("color", "#4caf50")
				$('#show-proposals').show()
			else if @id == 'emp-contacts'
				$(this).css("letter-spacing", "2px")
				$(this).css("color", "#4caf50")
				$('#show-contacts').show()
			else if @id == 'emp-updates'
				$(this).css("letter-spacing", "2px")
				$(this).css("color", "#4caf50")
				$('#show-updates').show()
			else if @id == 'emp-news'
				$(this).css("letter-spacing", "2px")
				$(this).css("color", "#4caf50")
				$('#create-club-update').show()
			else if @id == 'emp-site'
				$(this).css("letter-spacing", "2px")
				$(this).css("color", "#4caf50")
				$('#show-highlights').show()


			$('.update-proposal').click ->
				$('.employee-update-proposal').fadeIn(500)

			$('.employee-update-proposal').click ->
				$(this).fadeOut(500)

			$('#upload-empl-files').click ->
				$('.priv-opts').hide()
				$('#upload-empl').fadeIn(500)


			$('#edit-empl-acct').click ->
				$('.priv-opts').hide()
				$('#edit-empl').fadeIn(500)


			$('#show-all-files').click ->
				$('.priv-opts').hide()
				$('#all-memos-empl').fadeIn(500)
