class MoviesController < ApplicationController
  def index
    query = params[:query]

    if query.present?

      # sql_query = "movies.title @@ :query OR
      #              movies.syllabus @@ :query OR
      #              directors.first_name @@ :query OR
      #              directors.last_name @@ :query"

      # @movies = Movie.joins(:director).where(sql_query, query: "%#{query}%")

      @movies = Movie.super_search(query)
    else
      @movies = Movie.all
    end
  end
end
