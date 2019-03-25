require_relative('../db/sql_runner.rb')

class Member

  attr_accessor :first_name, :last_name, :age, :fitness_level

  def initialize(options)
    @id = options['id'].to_i if options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age'].to_i
    @fitness_level = options['fitness_level'].to_i
  end


  def save()
    sql = "INSERT INTO members (first_name, last_name, age, fitness_level) VALUES ($1, $2, $3, $4) RETURNING *"
    values = [@first_name, @last_name, @age, @fitness_level]
    @id = SqlRunner.run(sql, values).first['id']
  end

  def self.delete_all
    sql = "DELETE FROM members"
    SqlRunner.run(sql)
  end

  def update
    sql = "UPDATE member SET (first_name, last_name, age, fitness_level) = ($1, $2, $3, $4) WHERE id = $5"
  end

  def delete
    sql = "DELETE FROM members WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM members WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Member.new(result)
  end

  def self.find_all
    sql = "SELECT * FROM members"
    member_information = SqlRunner(sql)
    return member_information.map{|member| Member.new(member)}
  end

end
