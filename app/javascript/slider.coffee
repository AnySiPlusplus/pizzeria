$(document).ready ($) ->
#  setInterval (->
#    moveRight()
#    return
#  ), 3000

  moveLeft = ->
    $('#slider ul').animate { left: +slideWidth }, 200, ->
      $('#slider ul li:last-child').prependTo '#slider ul'
      $('#slider ul').css 'left', ''
      return
    return

  moveRight = ->
    $('#slider ul').animate { left: -slideWidth }, 200, ->
      $('#slider ul li:first-child').appendTo '#slider ul'
      $('#slider ul').css 'left', ''
      return
    return

  slideCount = $('#slider ul li').length
  slideWidth = $('#slider ul li').width()
  slideHeight = $('#slider ul li').height()
  sliderUlWidth = slideCount * slideWidth
  $('#slider').css
    width: slideWidth
    height: slideHeight
  $('#slider ul').css
    width: sliderUlWidth
    marginLeft: -slideWidth
  $('#slider ul li:last-child').prependTo '#slider ul'
  $('a.control_prev').click ->
    moveLeft()
    return
  $('a.control_next').click ->
    moveRight()
    return
  return
