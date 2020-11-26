class Movie < ApplicationRecord
  belongs_to :director

  include PgSearch::Model
  multisearchable against: [:title, :syllabus]



  pg_search_scope :super_search,
    against: {title: 'A', syllabus: 'B'},
    associated_against: {
      director: [:first_name, :last_name]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }


end
