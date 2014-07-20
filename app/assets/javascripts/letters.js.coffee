# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $("#letter_senderpreson_name").autocomplete
  	source: $('#letter_senderpreson_name').data('autocomplete-source')
  $("#letter_sendercompany_name").autocomplete
  	source: $('#letter_sendercompany_name').data('autocomplete-source')	

  $('#letter_reciever_tokens').tokenInput $('#letter_reciever_tokens').data('autocomplete-source'),
    minChars: 2
    allowCustomEntry: true
    preventDuplicates: true
    prePopulate: $('#letter_reciever_tokens').data('load')


  console.log("setting datepicker");
  $(".fa_date").datepicker();
  