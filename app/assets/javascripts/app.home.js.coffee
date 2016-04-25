$(document).on "ready page:load", ->
  app.home.init() if $(".public.pages.home").length > 0

app.home =
  init: ->
    $("#search_date").datepicker
      language: "fr"
      autoclose: true
      startDate: convertDate(new Date())
      orientation: "bottom"

    $("#scroll-down").click ->
      $("html, body").animate {
        scrollTop: $(".how-it-works").offset().top
      }, 750
