# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
		$('.emp-opts').click ->
			$('.empl-opts').hide()
			$('#emp-intro').hide()
			$('.help').hide()
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
			else if @id == 'emp-cal'
				$(this).css("letter-spacing", "2px")
				$(this).css("color", "#4caf50")
				$('#show-cal').show()
			else if @id == 'emp-post'
				$(this).css("letter-spacing", "2px")
				$(this).css("color", "#4caf50")
				$('#show-blog').show()


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

			$('.day-num').click ->
				if @id == "1"
					document.getElementById("evt-day-num").innerHTML = "1"
			
				else if @id == "2"
					document.getElementById("evt-day-num").innerHTML = "2"
				else if @id == "3"
					document.getElementById("evt-day-num").innerHTML = "3"
				else if @id == "4"
					document.getElementById("evt-day-num").innerHTML = "4"
				else if @id == "5"
					document.getElementById("evt-day-num").innerHTML = "5"
				else if @id == "6"
					document.getElementById("evt-day-num").innerHTML = "6"
				else if @id == "7"
					document.getElementById("evt-day-num").innerHTML = "7"
				else if @id == "8"
					document.getElementById("evt-day-num").innerHTML = "8"
				else if @id == "9"
					document.getElementById("evt-day-num").innerHTML = "9"
				else if @id == "10"
					document.getElementById("evt-day-num").innerHTML = "10"
				else if @id == "11"
					document.getElementById("evt-day-num").innerHTML = "11"
				else if @id == "12"
					document.getElementById("evt-day-num").innerHTML = "12"
				else if @id == "13"
					document.getElementById("evt-day-num").innerHTML = "13"
				else if @id == "14"
					document.getElementById("evt-day-num").innerHTML = "14"
				else if @id == "15"
					document.getElementById("evt-day-num").innerHTML = "15"
				else if @id == "16"
					document.getElementById("evt-day-num").innerHTML = "16"
				else if @id == "17"
					document.getElementById("evt-day-num").innerHTML = "17"
				else if @id == "18"
					document.getElementById("evt-day-num").innerHTML = "18"
				else if @id == "19"
					document.getElementById("evt-day-num").innerHTML = "19"
				else if @id == "20"
					document.getElementById("evt-day-num").innerHTML = "20"
				else if @id == "21"
					document.getElementById("evt-day-num").innerHTML = "21"
				else if @id == "22"
					document.getElementById("evt-day-num").innerHTML = "22"
				else if @id == "23"
					document.getElementById("evt-day-num").innerHTML = "23"
				else if @id == "24"
					document.getElementById("evt-day-num").innerHTML = "24"
				else if @id == "25"
					document.getElementById("evt-day-num").innerHTML = "25"
				else if @id == "26"
					document.getElementById("evt-day-num").innerHTML = "26"
				else if @id == "27"
					document.getElementById("evt-day-num").innerHTML = "27"
				else if @id == "28"
					document.getElementById("evt-day-num").innerHTML = "28"
				else if @id == "29"
					document.getElementById("evt-day-num").innerHTML = "29"
				else if @id == "30"
					document.getElementById("evt-day-num").innerHTML = "30"
				else if @id == "31"
					document.getElementById("evt-day-num").innerHTML = "31"


			$('.dash-bttn-help').click -> 
				$('.help').hide()
				if @id == 'help-calendar'
					$('#h-calendar').fadeIn(500)
				else if @id == 'help-add-employee'
					$('#h-add-employee').fadeIn(500)
				else if @id == 'help-show-investors'
					$('#h-show-investors').fadeIn(500)
				else if @id == 'help-updates'
					$('#h-updates').fadeIn(500)
				else if @id == 'help-show-clubs'
					$('#h-show-clubs').fadeIn(500)
				else if @id == 'help-show-highlights'
					$('#h-show-highlights').fadeIn(500)
				else if @id == 'help-show-employees'
					$('#h-show-employees').fadeIn(500)
				else if @id == 'help-show-country-managers'
					$('#h-country-managers').fadeIn(500)
				else if @id == 'help-all-beneficiaries'
					$('#h-all-beneficiaries').fadeIn(500)
				else if @id == 'help-show-proposals'
					$('#h-show-proposals').fadeIn(500)
				else if @id == 'help-system-logs'
					$('#h-system-logs').fadeIn(500)
				else if @id == 'help-priviledges'
					$('#h-priviledges').fadeIn(500)
				else if @id == 'help-blog'
					$('#h-blog').fadeIn(500)
				else if @id == 'social-media-curator'
					$('#h-social').fadeIn(500)

			$('.help').click ->
				$(this).fadeOut(500)

			$('.dash-bttn').click ->
				if @id == 'blog-show'
					$('#create-new-post').fadeOut(500)
					$('#show-all-posts').fadeIn(500)
				else if @id == 'blog-create'
					$('#show-all-posts').fadeOut(500)
					$('#create-new-post').fadeIn(500)

			$('.n-items').click ->
				$(this).animate({
					width: "70%",
					marginLeft: "0.6in",
					position: "absolute"
				}, 1500)


				
