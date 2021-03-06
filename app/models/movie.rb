class Movie < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  ratyrate_rateable "star"

  acts_as_commentable

  belongs_to :user

  has_many :actor_movies
  has_many :actors, through: :actor_movies, source: :person

  has_many :director_movies
  # has_many :directors, through: :director_movies, source: 'Person', foreign_key: 'person_id'
  has_many :directors, through: :director_movies, source: :person

  has_attached_file :image
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
