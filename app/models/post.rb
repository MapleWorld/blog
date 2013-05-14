class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :content, type: String

  validates :title, :length => {:minimum => 2}
  validates :title, :content, :presence => true
  validates :title, :uniqueness => true

  has_many :comments
  belongs_to :user
end
