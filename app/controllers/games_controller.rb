require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    response = open("https://wagon-dictionary.herokuapp.com/#{params[:word]}")
    json = JSON.parse(response.read)
    english_word = json['found']
    @result = params[:word].chars.all? { |letter| params[:word].count(letter) <= @letters.count(letter) }
  end
end
