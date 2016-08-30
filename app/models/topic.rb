class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :labelings, as: :labelable
  has_many :labels, through: :labelings

  scope :privately_viewable, -> { where(public: false) }
  scope :publically_viewable, -> { where(public: true) }
  scope :visible_to, -> (user) { user ? all : publically_viewable }
end
