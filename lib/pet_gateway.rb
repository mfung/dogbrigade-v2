class PetGateway
  def initialize
    @petfinder ||= Petfinder::Client.new
  end
  
  # options animal_type: location: breed: size: sex: location: shelterid:
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
  
  # options location: name: offset: count:
  def find_shelters(options = {})
    defaults = {:location => '90210'}
    options = defaults.merge(options)
    
    @petfinder.find_shelters(options[:location], options)
  end
  
  # options animal_type: breed: offset: count:
  def find_shelters_by_breed(options = {})
    defaults = {:animal_type => 'dog', :breed => 'German Shepherd Dog'}
    options = defaults.merge(options)
    
    @petfinder.find_shelters_by_breed(options[:animal_type], options[:breed])
  end
  
  # options id: status: offset: count:
  def shelter_pets(options = {})
    defaults = {:id => 1}
    options = defaults.merge(options)
    
    @petfinder.shelter_pets(options[:id], options)
  end
end