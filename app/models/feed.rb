class Feed < ActiveRecord::Base
  attr_accessible :title, :description, :url, :site_url, :last_modified_at

  has_many :posts, dependent: :destroy

  validates :title, presence: true
  validates :url,   presence: true, uniqueness: true

  scope :recent, order('last_modified_at DESC')
end