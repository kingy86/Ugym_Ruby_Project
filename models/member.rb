class Member

  attr_reader :first_name, :last_name, :age, :fitness_level

  def initialize(options)
    @id = options['id'].to_i if options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age'].to_i
    @fitness_level = options['fitness_level'].to_i
  end

end
