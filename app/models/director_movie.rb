class DirectorMovie < ActiveRecord::Base
  belongs_to :movie, class_name: "Movie", foreign_key: "movie_id"
  belongs_to :person, class_name: "Person",  foreign_key: "person_id"
end
