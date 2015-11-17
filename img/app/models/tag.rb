class Tag < ActiveRecord::Base
  validates :tag, presence: true
  belongs_to :image, dependent: :destroy
end
