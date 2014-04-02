# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#event_event_start').datepicker
  	dateFormat: 'yy-mm-dd'

#$(document).ready ->
#  $("#time_begin").change ->
#    $(this).next().toggleClass('grey')
#    if $(this).is(":checked")
#      $("#event_time_begin_4i").removeAttr "disabled"
#      $("#event_time_begin_5i").removeAttr "disabled"
#      $("#event_time_begin_4i option:eq(20)").prop('selected', true)
#      $("#event_time_begin_5i option:eq(1)").prop('selected', true)
#      $("#div_time div").hide()
#    else
#      $("#event_time_begin_4i").attr "disabled", "disabled"
#      $("#event_time_begin_5i").attr "disabled", "disabled"
#      $("#event_time_begin_4i option:eq(0)").prop('selected', true)
#      $("#event_time_begin_5i option:eq(0)").prop('selected', true)
#      $("#div_time div").show()
#    return
#
#  $("#location").change ->
#    $(this).next().toggleClass('grey')
#    if $(this).is(":checked")
#      $("#event_location").removeAttr("disabled").val ""
#      $("#div_location  div").hide();
#    else
#      $("#event_location").attr("disabled", "disabled").val ""
#      $("#div_location  div").show();
#    return
#
#  $("#address").change ->
#    $(this).next().toggleClass('grey')
#    if $(this).is(":checked")
#      $("#event_address").removeAttr("disabled").val ""
#      $("#div_address div").hide();
#    else
#      $("#event_address").attr("disabled", "disabled").val ""
#      $("#div_address div").show();
#    return
#
#  return