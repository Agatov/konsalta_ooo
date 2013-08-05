$ ->


  $('.order-button').bind 'click', ->

    $('.modal-overlay').unbind 'click'
    $('.modal-overlay').bind 'click', ->
      hide_order_form()

    show_order_form()
    yaCounter21643645.reachGoal('order_call')
    false

  $('#send-order').bind 'click', ->

    $.post '/orders', {'order[username]': $('input[name=username]').val(), 'order[phone]': $('input[name=phone]').val()}, (data) =>
      yaCounter21643645.reachGoal('add_contact')
      $('.modal-overlay').unbind 'click'
      $('.modal-overlay').bind 'click', ->
        hide_thank_you()

      show_thank_you()

    false


  $('#hide-thank-you').bind 'click', ->
    hide_thank_you()
    false



  $(".submit").bind 'click', ->

    $.post '/orders', {'order[username]': $('input[name=username]').val(), 'order[phone]': $('input[name=phone]').val()}, (data) =>
      if data.status == 'ok'
        $('.order-form .success').show 'blind'


window.show_order_form = ->
  $('.modal-overlay').show()
  $('.modal-overlay').animate({'opacity': '0.8'}, 300, ->
    $('.modal-dialog').css('bottom', '-300px')
    $('.modal-dialog').css('left', '50%')
    $('.modal-dialog').show()
    $('.modal-dialog').animate({'bottom': '50%'}, 500)
  )

window.hide_order_form = ->
  $('.modal-dialog').animate({'left': '-2000px'}, 500, ->
    $('.modal-dialog').hide()
    $('.modal-overlay').animate {'opacity': '0'}, 300, ->
      $('.modal-overlay').hide()
  )


window.show_thank_you = ->

  $('.modal-dialog').animate({'left': '-2000px'}, 500, ->
    $('.modal-dialog').hide()

    $('.modal-thank-you').css('right', '-500px')
    $('.modal-thank-you').css('top', '50%')
    $('.modal-thank-you').show()
    $('.modal-thank-you').animate {'right': '50%'}, 500

#    $('.modal-overlay').animate {'opacity': '0'}, 300, ->
#      $('.modal-overlay').hide()
  )

window.hide_thank_you = ->
  $('.modal-thank-you').animate {'top': '-2000px'}, 500, ->
    $('.modal-thank-you').hide()
    $('.modal-overlay').animate {'opacity': '0'}, 300, ->
      $('.modal-overlay').hide()

