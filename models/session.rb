class Session


  attr_accessor :name, :intensity, :capacity

  def initialize(options)
    @id = options['id'] if options['id']
    @name = options['name']
    @intensity = options['intensity']
    @capacity = []
  end


  
end
