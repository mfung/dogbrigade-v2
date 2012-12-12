class PagesController < ApplicationController
  respond_to :html
  def index
    @presenter = ::Pages::IndexPresenter.new(current_user)
  end
  def about_us
  end
end
