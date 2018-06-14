# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->

				$('.bene-options').click ->
					$('.bene-options').css("color", " #7f60a9")
					$('.allOptions').hide()
					if @id == 'bene-news'
						$(this).css("color", "#4caf50")
						$('#ben-news-account').fadeIn(500)
					else if @id == 'bene-apply'
						$(this).css("color", "#4caf50")
						$('#ben-apply-account').fadeIn(500)
					else if @id == 'bene-clubs'
						$(this).css("color", "#4caf50")
						$('#ben-clubs-account').fadeIn(500)
					else if @id == 'bene-account'
						$(this).css("color", "#4caf50")
						$('#ben-account-account').fadeIn(500)

					$('#sub-proj-plan').click ->
						$('#project_status').fadeOut(500)	
						$('#bene-proj-apply').fadeIn(500)
						$('#close-sub-plan').fadeIn(500)
						$(this).hide()

					$('#close-sub-plan').click ->
						$('#bene-proj-apply').fadeOut(500)
						$('#project_status').fadeIn(500)
						$('#sub-proj-plan').fadeIn(500)
						$(this).hide()


				$('#update_project').click -> 
					$('.edit_project').fadeIn(500)

				$('#view-proj').click -> 
					$('.proj-plan').fadeIn(500)

				$('.proj-plan').click ->
					$(this).fadeOut(500)