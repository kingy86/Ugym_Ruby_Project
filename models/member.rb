require_relative('../db/sql_runner.rb')

class Member

  attr_reader :id, :session_name
  attr_accessor :first_name, :last_name, :age, :fitness_level, :session_id

  def initialize(options)
    @id = options['id'].to_i if options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age'].to_i
    @fitness_level = options['fitness_level'].to_i
    @session_id = options['session_id'].to_i
    @session_name = options['session_name']
  end


  def save()
    sql = "INSERT INTO members (first_name, last_name, age, fitness_level, session_id) VALUES ($1, $2, $3, $4, $5) RETURNING *"
    values = [@first_name, @last_name, @age, @fitness_level, @session_id]
    @id = SqlRunner.run(sql, values).first['id']
  end

  def self.delete_all
    sql = "DELETE FROM members"
    SqlRunner.run(sql)
  end

  def update
    sql = "UPDATE members SET (first_name, last_name, age, fitness_level, session_id) = ($1, $2, $3, $4, $5) WHERE id = $6"
    values = [@first_name, @last_name, @age, @fitness_level, @session_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM members WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT members.*,
            sessions.name as session_name
            FROM members
            INNER JOIN sessions
            ON members.session_id = sessions.id
            WHERE members.id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Member.new(result)
  end

  def self.find_all
    sql = "SELECT members.*,
            sessions.name as session_name
            FROM members
            INNER JOIN sessions
            ON members.session_id = sessions.id"
    member_information = SqlRunner.run(sql)
    return member_information.map{|member| Member.new(member)}
  end

end
