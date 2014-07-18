# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
#	$('#equipment_state_id').parent().hide()
	  states = $('#equipment_state_id').html()
	  $('#equipment_country_id').change ->
	    country = $('#equipment_country_id :selected').text()
	    escaped_country = country.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
	    options = $(states).filter("optgroup[label='#{escaped_country}']").html()
	    if options
	      $('#equipment_state_id').html(options)
#	      $('#equipment_state_id').parent().show()
	    else
	      $('#equipment_state_id').empty()
#	      $('#equipment_state_id').parent().hide()


			