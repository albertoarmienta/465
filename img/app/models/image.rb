class Image < ActiveRecord::Base
  has_many :tags
  has_many :image_users
  has_many :users, through: :image_users
#  belongs_to :user
  def generateFilename
    SecureRandom.hex(5)
  end
end
