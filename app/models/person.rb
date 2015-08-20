class Person < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user

  has_many :director_movies
  has_many :acted_movies, through: :director_movies, source: :movie

  has_many :actor_movies
  has_many :directed_movies, through: :actor_movies, source: :movie

  has_attached_file :image
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
