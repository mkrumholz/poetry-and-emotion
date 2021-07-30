class SearchController < ApplicationController
  def index
    @poems = PoetryDbFacade.top_10_poems_by(params[:author])
  end
end
