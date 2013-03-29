module Search
  class ShowPresenter
    def initialize(user, pet_gateway, pet_id)
      @user          = user
      @pet_gateway   = pet_gateway
      @pet_id = pet_id
    end
    
    def dog
      @dog = @pet_gateway.pet(@pet_id)
    end
  end
end