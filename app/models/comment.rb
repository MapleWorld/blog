class Comment
  include Mongoid::Document

  field :commenter, type: String
  field :body, type: String
  #embedded_in :post

  belongs_to :post
  belongs_to :user
end
