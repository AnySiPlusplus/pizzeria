$(document).ready ($) ->
  dropDown = $('#dropdown')
  settingsMenu = $('.settings-menu')
  dropDown.click ->
    if dropDown.hasClass('settings')
      dropDown.removeClass('settings')
      settingsMenu.removeClass('hidden')
      dropDown.addClass('settings-open')
    else
      dropDown.removeClass('settings-open')
      dropDown.addClass('settings')
      settingsMenu.addClass('hidden')
