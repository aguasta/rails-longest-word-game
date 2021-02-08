require 'open-uri'

class GamesController < ApplicationController


    def new 

        @letters = value = ""; 10.times{value  << (65 + rand(25)).chr}


    end 


    def score
       
        @letters = params[:letters]
        @word = params[:word]

        @split_word = @word.split(//)

        @split_word.each do |letter|
            if @letters.count(letter) >= @split_word.count(letter)
                @result = "it's a match"
            else 
                @result = "not match"
            end 

        end

    
    @attempt = params[:word].downcase
    @url = "https://wagon-dictionary.herokuapp.com/#{@attempt}"
    @word = JSON.parse(open(@url).read)
    if @word['found'] == false
      return @message = "not an English word..."
    else
      return @message = "Word exists"
    end

    end 
end
