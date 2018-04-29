# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
		b = window.location.pathname
		if b == '/'
			$('li a').removeClass('current_link')
			$('#home-link').addClass('current_link')
		else if b == '/open_account'
			$('li a').removeClass('current_link')
			$('#account-link').addClass('current_link')
		else if b == '/enterprise'
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

		$('.deem-paragraph').mouseenter ->
			$(this).css("color", "#c7e1f51c")
			if @id == "main-p"
				$(this).css("color", "#C7E1F5")
			else if @id == 'fund-p'
				$(this).css("color", "#C7E1F5")
			else if @id == 'eco-p'
				$(this).css("color", "#C7E1F5")
			else if @id == 'con-p'
				$(this).css("color", "#C7E1F5")
			else if @id == 'roi-p'
				$(this).css("color", "#C7E1F5")


		$('.deem-paragraph').mouseleave ->
			if @id == "main-p"
				$(this).css("color", "#c7e1f51c")
			else if @id == 'fund-p'
				$(this).css("color", "#c7e1f51c")
			else if @id == 'eco-p'
				$(this).css("color", "#c7e1f51c")
			else if @id == 'con-p'
				$(this).css("color", "#c7e1f51c")
			else if @id == 'roi-p'
				$(this).css("color", "#c7e1f51c")



