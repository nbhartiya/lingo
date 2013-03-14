# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  word_index = Math.floor(Math.random()*gon.words.length)
  window.word = word = gon.words[word_index]
  window.guess_number = 1
  cell = $("tr:first-child td:first-child")
  $(cell).html word[0]
  $(cell).addClass "red"
  word[0]
  
  $("button").on "click", ->
    console.log "clicked!"
    guess = $("input").val().toLowerCase()
    if $.inArray(guess, gon.words) != -1
      for character, i in guess
        selector = "tr:nth-child(#{guess_number+1}) td:nth-child(#{i+1})"
        console.log selector
        cell = $(selector)
        cell.html(character)
        if character == word[i]
          #this is capital red letter (it's in the right place)
          $(cell).addClass "red"
        else if $.inArray(character, word) != -1
          #this is a capital blue letter (it's in the word in another slot)
          $(cell).addClass "blue"
      $("ol").append("<li>#{guess}</li>")
      guess_number++
      if guess_number == 5
        alert "You lost! The word was #{word.toUpperCase()}. Hit refresh and play again..."
    else
      alert "#{guess} is not a word in our dictionary. Try an existing five letter word!"