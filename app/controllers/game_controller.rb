class GameController < ApplicationController
  def index
    file_path = Rails.root.join("config", "words5.flat")
    words = File.read(file_path).split("\n")
    gon.words = words
  end
end
