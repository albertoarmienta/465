load "#{Rails.root}/lib/ladder.rb"
class HomeController < ApplicationController

  def index
    @startWord = dictionary[Random.new.rand(0..dictionary.size - 1)]
    @endWord = dictionary[Random.new.rand(0..dictionary.size - 1)]
    while(@endWord == @startWord)
      @endWord = dictionary[Random.new.rand(0..dictionary.size - 1)]
    end
  end

  def answer
    @answersArray = Array.new
    tempArray = Array.new
    tempArray.push(params[:startWord])
    params.each do |key, value|
      if (key.to_s[/answer\d/])
        if (!value.blank?)
          @answersArray.push(value)
          tempArray.push(value)
        end
      end
    end
    tempArray.push(params[:endWord])
    @correct = legal tempArray
  end
end
