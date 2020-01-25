class Dog
  
  attr_accessor 
  
  def initialize(id: nil, name:, breed:)
    (@id, @name, @breed) = (id, name, breed)
  end
  
  def self.create_table
    DB[:conn].execute()
  end

  def self.drop_table
    DB[:conn].execute()
  end
  
  def save
    DB[:conn].execute()
  end
  
  def self.create
    DB[:conn].execute()
  end
  
  def self.new_from_db
    DB[:conn].execute()
  end
  
  def self.find_by_id
    DB[:conn].execute()
  end
  
  def self.find_or_create_by
    DB[:conn].execute()
  end
  
  def find_by_name
    DB[:conn].execute()
  end
  
  def update
    DB[:conn].execute()
  end
  
end