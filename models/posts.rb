class Post
  include Mongoid::Document

  field :title, type: String
  field :content, type: String
  field :created_at, type: Time, default: Time.now
  
end