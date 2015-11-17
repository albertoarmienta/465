class Image < ActiveRecord::Base
  has_many :tags
  has_many :image_users
  has_many :users, through: :image_users
#  belongs_to :user
  def generateFilename
    int = SecureRandom.hex(5)
    while !`find ~/465/img/public/images/ -n #{int}.jpg`.blank?
      int = SecureRandom.hex(5)
    end
    return "#{int}.jpg"
  end
end
