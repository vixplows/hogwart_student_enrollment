require_relative('../db/sql_runner')

class House

  attr_reader :id, :name, :url

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @url = options['url']
  end

#need to save id - so can be referenced in the seeds.rb. No real need in code below to use * rather than id, in this case actually only need to return/use the id, i.e. it would be more efficient to use id if had large db
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

# if returning a hash need to create a new instance/object like below. Need the .first to get first hash out of the array
  def self.find(id)
    sql = "SELECT * FROM houses WHERE id = #{id}"
    house = SqlRunner.run(sql).first
    result = House.new(house)
    return result
  end

end
