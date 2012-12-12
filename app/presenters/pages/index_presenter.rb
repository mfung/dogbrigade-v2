module Pages
  class IndexPresenter
    def initialize(user)
      @user = user
    end
    
    def random_dog
      @random_dog ||= PetGateway.new.random
    end
  end
end