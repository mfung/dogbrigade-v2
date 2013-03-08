module Pages
  class IndexPresenter
    def initialize(user, pet_gateway)
      @user = user
      @pet_gateway = pet_gateway
    end
    
    def random_dog
      if @user && @user.try(:zip_code)
        @random_dog ||= @pet_gateway.random(@user.zip_code)
      else
        @random_dog ||= @pet_gateway.random
      end
    end
  end
end