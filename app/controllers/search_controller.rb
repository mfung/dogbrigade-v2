class SearchController < ApplicationController
  def index
  end

  def show
  end

  def results
    @presenter = ::Search::ResultsPresenter.new(current_user, pet_gateway, params[:search], params[:search][:page])
  end
end
