class Lovehotel
  include Mongoid::Document
  
  field :location, type: Array
  field :name, type: String
end
