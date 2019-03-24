require_relative('../db/sql_runner.rb')

class Session


  attr_accessor :name, :intensity, :capacity

  def initialize(options)
    @id = options['id'] if options['id']
    @name = options['name']
    @intensity = options['intensity'].to_i
    @capacity = options['capacity']
  end

  def save()
    sql = "INSERT INTO sessions (name, intensity, capacity) VALUES ($1, $2, $3) RETURNING *"
    values = [@name, @intensity, @capacity]
    @id = SqlRunner.run(sql, values).first['id']
  end

  def self.delete_all
    sql = "DELETE FROM sessions"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM sessions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update
    sql = "UPDATE sessions SET (name, intensity, capacity) = ($1, $2, $3) WHERE id = $4"
    values = [@name, @intensity, @capacity, @id]
    SqlRunner.run(sql, values)
  end

end
