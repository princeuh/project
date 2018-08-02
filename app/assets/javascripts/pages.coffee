# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
		b = location.pathname
		if b == '/'
			$('li a').removeClass('current_link')
			$('#home-link').addClass('current_link')
			myIndex = 0

			carousel = ->
				i = undefined
				x = document.getElementsByClassName('headlines')
				i = 0
				while i < x.length
					x[i].style.display = 'none'
					i++
				myIndex++
				if myIndex > x.length
					myIndex = 1
				x[myIndex - 1].style.display = "inline-block"
				setTimeout carousel, 2000
				return

			carousel()

		else if b == '/open_account'
			$('li a').removeClass('current_link')
			$('#account-link').addClass('current_link')
		else if b == '/enterprises'
			$('li a').removeClass('current_link')
			$('#enterprise-link').addClass('current_link')
		else if b == '/ventures'
			$('li a').removeClass('current_link')
			$('#venture-link').addClass('current_link')
		else if b == '/about'
			$('li a').removeClass('current_link')
			$('#about-link').addClass('current_link')
		else if b == '/team'
			$('li a').removeClass('current_link')
			$('#team-link').addClass('current_link')
		else if b == '/terms'
			$('li a').removeClass('current_link')
			$('#terms-link').addClass('current_link')
		else if b == '/privacy'
			$('li a').removeClass('current_link')
			$('#privacy-link').addClass('current_link')
		else if b == '/careers'
			$('li a').removeClass('current_link')
			$('#careers-link').addClass('current_link')
		else if b == '/contact'
			$('li a').removeClass('current_link')
			$('#contact-link').addClass('current_link')
		else if b == '/news'
			$('li a').removeClass('current_link')
			$('#news-link').addClass('current_link')
		else if b == '/apply_funding'
			$('li a').removeClass('current_link')
			$('#apply-link').addClass('current_link')


		$('#show-login-opts').mouseover ->
			$('#login-opts').slideDown()

		$('#show-login').click ->
			alert "clicked"

		$('#login-opts').mouseleave ->
			$('#login-opts').hide()

		$('.ben-holder').slideDown(1500)

		$('.deem-paragraph').mouseenter ->
			$(this).css("color", "#8dc2e6")

		$('.deem-paragraph').mouseleave ->
			$(this).css("color", "#8dc2e640")

		$('.h-header').mouseenter ->
			$(this).css("transform", "scale(2.5)")

		$('.h-header').mouseleave ->
			$(this).css("transform", "scale(1.0)")

		$('.h-header').click ->	
			$('.h-content').fadeOut(500)
			$(this).css("color", "#d6bad5")
			$(this).css("transform", "scale(1.0)")
			if @id == '1'
				$('#content-1').fadeIn(500)
				$(this).css("color", "#C2188D")
				$(this).css("transform", "scale(2.5)")






