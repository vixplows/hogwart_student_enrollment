require_relative('../db/sql_runner')

class House

  attr_reader :id, :name, :url

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @url = options['url']
  end

  def save()
    sql = "INSERT INTO houses (name, url) VALUES ('#{@name}', '#{@url}') RETURNING *"
    house = SqlRunner.run(sql)
    @id = house.first()['id'].to_i
  end

  def self.find_all()
    sql = "SELECT * FROM houses"
    houses = SqlRunner.run(sql)
    result = houses.map{ |house| House.new(house)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM houses WHERE id = #{id}"
    house = SqlRunner.run(sql).first
    result = House.new(house)
    return result
  end

end
