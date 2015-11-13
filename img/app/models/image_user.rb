class ImageUser < ActiveRecord::Base
  belongs_to :image, dependent: :destroy
  belongs_to :user
end
