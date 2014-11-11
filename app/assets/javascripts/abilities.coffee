# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# TODO not working
$ ->
  $("button[add-value]").click (e) ->
    e.preventDefault()

    document.getElementById("empty-spaces-loader").html("<% @ability.values.build %>")
    document.getElementById("values").load()
