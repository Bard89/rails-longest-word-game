require 'open-uri'
require 'json'

class GamesController < ApplicationController

  # def initialize
  #   @@letters = ''
  # end

  def new
    # @letters = Array.new(10) { ('A'..'Z').to_a.sample }
    @letters = generate_grid(10)
  end

  def score
    @params = params # params appears the moment one runs/defines the form value ASIO
    @guess_query = params[:guess] # that's my input
    # raise # for debugging
    @grid = params[:grid] # params is hash, :grid is the key, one has to read what was generated
    @true_word = true_word?(@input)
    @letters = 'sdsd'
  end

  # we will also implement the logic here, later it should be in the model ASIO

  # grid is basically 1D grid, so more like an arraym, not sure why is it called grid?
  def generate_grid(grid_size)
    Array.new(grid_size) { ('A'..'Z').to_a.sample } # random grid of letter
  end

  def run_game(attempt, grid)
    # runs the game and return detailed hash of result (with `:score`, `:message` and `:time` keys)
  end

  # should work
  def true_word?(word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found'] # found comes from the API and is boolean, found -> true or not -> false
  end

  def included?(guess, grid)
    guess.chars.all? { |letter| guess.count(letter) <= grid.count(letter) }
  end
end
