# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# TODO not working
$ ->
  $("button[add-ability]").click (e) ->
    e.preventDefault()

    document.getElementById("empty-spaces-loader").html("<% @competence_matrix.abilities.build %>")
    document.getElementById("abilities").load()

  $("button[add-knowledge-area]").click (e) ->
    e.preventDefault()

    document.getElementById("empty-spaces-loader").html("<% @competence_matrix.knowledge_areas.build %>")
    document.getElementById("knowledge-areas").load()

  $("button[add-value]").click (e) ->
    e.preventDefault()

    document.getElementById("empty-spaces-loader").html("<% @competence_matrix.values.build %>")
    document.getElementById("values").load()
