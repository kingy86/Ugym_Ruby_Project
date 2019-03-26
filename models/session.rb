require_relative('../db/sql_runner.rb')

class Session

  attr_reader :id
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

  def self.find
    sql = "SELECT * FROM sessions WHERE id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values).first
    return Session.new(result)
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

  def self.find(id)
    sql = "SELECT * FROM sessions WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Session.new(result)
  end

 def self.find_all
   sql = "SELECT * FROM sessions"
   session_information = SqlRunner.run(sql)
   return session_information.map{|session| Session.new(session)}
 end

end
