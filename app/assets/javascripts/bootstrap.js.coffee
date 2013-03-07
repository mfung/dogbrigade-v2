jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()

  $(document).on 'click', '.nav-tabs > li > a', ((event)->
    $('.nav-tabs li').removeClass('active')
    $(this).parents('li').addClass('active')
    active_window = $(this).data('window')
    $('.window').hide()
    $("#"+active_window).show()
    event.preventDefault())