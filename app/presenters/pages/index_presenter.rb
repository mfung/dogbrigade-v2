module Pages
  class IndexPresenter
    def initialize(user)
      @user = user
    end
    
    def random_dog
      if @user && @user.try(:zip_code)
        @random_dog ||= PetGateway.new.random(@user.zip_code)
      else
        @random_dog ||= PetGateway.new.random
      end
    end
  end
end