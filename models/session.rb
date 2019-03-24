require_relative('../db/sql_runner.rb')

class Session


  attr_accessor :name, :intensity, :capacity

  def initialize(options)
    @id = options['id'] if options['id']
    @name = options['name']
    @intensity = options['intensity'].to_i
    @capacity = options['capacity'].to_i
  end

  def save()
    sql = "INSERT INTO sessions (name, intensity, capacity) VALUES ($1, $2, $3) RETURNING *"
    values = [@name, @intensity, @capacity]
    @id = SqlRunner.run(sql, values).first['id']
  end

end
