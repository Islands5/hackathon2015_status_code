class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :location, type: Array
  embedded_in :user
end
