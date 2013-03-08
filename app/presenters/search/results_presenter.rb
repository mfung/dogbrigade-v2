module Search
  class ResultsPresenter
    def initialize(user, pet_gateway, search_params, page)
      @user          = user
      @pet_gateway   = pet_gateway
      @search_params = search_params
      @page          = page
    end
    
    def dogs
      @dogs = @pet_gateway.find(@search_params.merge({offset: @page.to_i*10, count:10}))
    end

    def searched_dog
      @searched_dog = @search_params
    end

    def page
      @page = @search_params['page'] || 0
    end
  end
end