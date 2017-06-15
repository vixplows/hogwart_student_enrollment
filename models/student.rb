require_relative('../db/sql_runner')

class Student

  attr_reader :id, :first_name, :second_name, :house_id, :age, :url

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @second_name = options['second_name']
    @house_id = options['house_id'].to_i
    @age = options['age'].to_i
    @url = options['url']

  end

  def save()
    sql = "INSERT INTO students ( first_name, second_name, house_id, age, url )
          VALUES
          ('#{@first_name}', '#{@second_name}', '#{@house_id}', #{@age}, '#{@url}')
          RETURNING *"
    student = SqlRunner.run(sql)
    @id = student.first()['id'].to_i
  end

  def house_id()
    sql = "SELECT houses.* FROM houses WHERE id = #{@house_id}"
    result = SqlRunner.run(sql)
    house_info = result[0]
    house = House.new(house_info)
    return house.name
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id=#{id}"
    student = SqlRunner.run(sql).first
    result = Student.new(student)
    return result
  end

  def self.find_all()
    sql = "SELECT * FROM students"
    students = SqlRunner.run(sql)
    result = students.map{ |student| Student.new(student)}
    return result
  end


end