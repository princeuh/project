# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
				$('.bene-options').mouseenter ->
					$(this).css("color", "#4caf50")

				$('.bene-options').mouseleave ->
					$(this).css("color", "#3f83b1")


				$('.bene-options').click ->
					$('.bene-options').removeClass('active-ben-opts')
					$('.allOptions').hide()
					if @id == 'bene-news'
						$(this).addClass('active-ben-opts')
						$('#ben-news-account').fadeIn(500)
					else if @id == 'bene-apply'
						$(this).addClass('active-ben-opts')
						$('#ben-apply-account').fadeIn(500)
					else if @id == 'bene-clubs'
						$(this).addClass('active-ben-opts')
						$('#ben-clubs-account').fadeIn(500)
					else if @id == 'bene-account'
						$(this).addClass('active-ben-opts')
						$('#ben-account-account').fadeIn(500)
