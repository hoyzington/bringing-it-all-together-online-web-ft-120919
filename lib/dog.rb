class Dog
  
  attr_accessor :id, :name, :breed
  
  def initialize(id: nil, name:, breed:)
    @id, @name, @breed = id, name, breed
  end
  
  def self.create_table
    sql = <<-SQL
      CREATE TABLE dogs (id INTEGER PRIMAEY KEY, name TEXT, breed TEXT)
    SQL
    DB[:conn].execute(sql)
  end

  def self.drop_table
    DB[:conn].execute("DROP TABLE dogs")
  end
  
  def save
    sql = "INSERT INTO dogs (name, breed) VALUES (?, ?)"
    DB[:conn].execute(sql, self.name, self.breed)
    @id = DB[:conn].execute("SELECT * FROM dogs")[0][0]
  end
  
  def self.create(name:, breed:)
    dog = self.new(name, breed)
    dog.save
    dog
  end
  
  def self.new_from_db(row)
    self.new(row[0], row[1], row[2])
  end
  
  def self.find_by_id(id)
    sql = "SELECT * FROM dogs WHERE id = ?"
    row = DB[:conn].execute(sql, id)[0]
    self.new_from_db(row)
  end
  
  def self.find_or_create_by(name:, breed:)
    record = DB[:conn].execute("SELECT * FROM dogs WHERE name = ? AND breed = ?", name, breed)
    if !record.empty?
      data = dog[0]
      dog = Dog.new(data[0], data[1], data[2])
    else
      dog = self.create(name: name, breed: breed)
    end
    dog
  end
  
  def self.find_by_name(name)
    sql = "SELECT * FROM dogs WHERE name = ?"
    row = DB[:conn].execute(sql, name)[0]
    self.new_from_db(row)
  end
  
  def update
    sql = "UPDATE dogs SET (name, breed) VALUES (?, ?)"
    DB[:conn].execute(sql)
  end
  
end