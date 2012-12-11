class PetGateway
  def initialize
    @petfinder ||= Petfinder::Client.new
  end
  
  def find(options = {})
    defaults = {:animal_type => 'dog', :location => '90210'}
    options = defaults.merge(options)
    
    @petfinder.find_pets(options[:animal_type], options[:location], options)
  end
  
  def random
    @petfinder.random_pet(:animal => 'dog')
  end
  
  def breeds(animal_type = 'dog')
    @petfinder.breeds(animal_type)
  end
  
  def pet(id = nil)
    @petfinder.pet(id)
  end
  
  def shelter(id = nil)
    @petfinder.shelter(id)
  end
  
  def find_shelters(options = {})
    defaults = {:location => '90210'}
    options = defaults.merge(options)
    
    @petfinder.find_shelters(options[:location], options)
  end
end