class Robot
  attr_reader :id,
              :name,
              :city,
              :state,
              :birthdate,
              :department

 def initialize(data)
   @id          = data["id"]
   @name        = data["name"]
   @city        = data["city"]
   @state       = data["state"]
   @birthdate   = data["birthdate"]
   @department  = data["department"]
 end
end
