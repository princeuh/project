# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
			$('.investor-bttn-options').click ->
				$('.allOptions').hide()
				$('.investor-bttn-options').css("color", " #233766")
				if @id == 'show-myClubs'
					$('#investor-myClubs').show()
					$(this).css("letter-spacing", "2px")
					$(this).css("color", "#4caf50")
				else if @id == 'show-allClubs'
					$('#investor-allClubs').show()
					$(this).css("letter-spacing", "2px")
					$(this).css("color", "#4caf50")
				else if @id == 'show-proposal'
					$('#investor-proposal').show()
					$(this).css("letter-spacing", "2px")
					$(this).css("color","#4caf50")
				else if @id == 'show-account'
					$('#investor-acct').show()
					$(this).css("letter-spacing", "2px")
					$(this).css("color", "#4caf50")
				else if @id == "profile"
					$('#investor-updates').show()
					$(this).css("letter-spacing", "2px")
					$(this).css("color", "#4caf50")
				else if @id == "show-news"
					$('#investor-news').show()
					$(this).css("letter-spacing", "2px")
					$(this).css("color", "#4caf50")
				else if @id == 'bene-account'
					$('bene-account').show()
					$(this).css("letter-spacing", "2px")
					$(this).css("color", "#4caf50")

			$('.dash-bttn').click -> 
				$('.dash-account').fadeOut()
				if @id == 'acct-profile'
					$('#dash-profile').fadeIn(500)
				else if @id == 'acct-contacts'
					$('#dash-contacts').fadeIn(500)
				else if @id == 'acct-email'
					$('#dash-email').fadeIn(500)
				else if @id == 'acct-pass'
					$('#dash-pass').fadeIn(500)


			$('#active-member').click ->
					$('#more-payment').show()

			$('#join_club').click ->
					$('#show-amt').fadeIn(500)

			$('.invest-amt').mouseenter ->
					$(this).css("background-color", "#b8e2ff")
					$(this).css("color", "white")

			$('.invest-amt').mouseleave ->
					$(this).css("background-color", "rgba(255, 255, 255, 0.80)")
					$(this).css("color", "#3f83b1")

			$('.invest-amt').click ->
				$('#charge-card').fadeIn()
				if @id == 'twentyFive'
					document.getElementById("selected-amt").innerHTML = "$25"
					$(this).css("color", "#4caf50")
				else if @id == 'fifty'
					document.getElementById("selected-amt").innerHTML = "$50"
					$(this).css("color", "#4caf50")
				else if @id == 'hundred'
					document.getElementById("selected-amt").innerHTML = "$100"
					$(this).css("color", "#4caf50")
				else if @id == 'fiveHundred'
					document.getElementById("selected-amt").innerHTML = "$500"
					$(this).css("color", "#4caf50")
				else if @id == 'thousand'
					document.getElementById("selected-amt").innerHTML = "$1000"
					$(this).css("color", "#4caf50")
				else if @id == 'fiveThousand'
					document.getElementById("selected-amt").innerHTML = "$5000"
					$(this).css("color", "#4caf50")
				else if @id == 'tenThousand'
					document.getElementById("selected-amt").innerHTML = "$10000"
					$(this).css("color", "#4caf50")
				else if @id =='twentyFiveThousand'
					document.getElementById("selected-amt").innerHTML = "$25000"
					$(this).css("color", "#4caf50")
				else if @id == 'fiftyThousand'
					document.getElementById("selected-amt").innerHTML = "$50000"
					$(this).css("color", "#4caf50")
				else if @id == 'hundredThousand'
					document.getElementById("selected-amt").innerHTML = "$100000"
					$(this).css("color", "#4caf50")
				else if @id == 'fiveHundredThousand'
					document.getElementById("selected-amt").innerHTML = "$500000"
					$(this).css("color", "#4caf50")

			$('#charge-card').click -> 
				$(this).fadeOut(500)


			setTimeout ( ->
				$('.alert-success').remove()
				return
			), 10000

			setTimeout ( ->
				$('.alert-danger').remove()
				return
			), 10000