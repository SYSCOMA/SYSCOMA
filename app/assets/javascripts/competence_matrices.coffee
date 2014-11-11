# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# TODO not working
$ ->
  $("button[add-ability]").click (e) ->
    e.preventDefault()
 
    alert("asdadda")
    document.getElementById("empty-spaces-loader").html("<% @competence_matrix.abilities.build %>")
    alert("asdadda2")
    document.getElementById("abilities").load()
    alert("asdadda3")
