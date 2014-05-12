class QuestionsController < ApplicationController
  def question_1
    # What is the most recent movie on the list that the second actor appeared in?

    # Your Ruby goes here.
    @the_actor = Actor.second.id
    @movies_for_the_second_actor = Movie.where(:the_actor.movies.count => @the_actor)
    @movies_for_the_second_actor.order("year DESC").first.title
  end

  def question_2
    # Who directed the longest movie on the list?

    the_longest_movie_director_id = Movie.order("duration ASC").last.director_id
    # @director_of_longest_movie = ???
    Director.find(the_longest_movie_director_id).name
  end

  def question_3
    # Which director has the most movies on the list?

    movie_counts = {}
    Director.all.each do |the_director|
    the_director.movies.count
  end

  @most_number_of_movies_by_a_single_director = movie_counts.sort
  @director_with_the_most_movies = (movie_counts.sort).name
  end

  def question_4
    # Which actor has been in the most movies on the list?
    # (If there's a tie, any one of them is fine)

    # Your Ruby goes here.

    top_actor = Actor.new

  Actor.all.each do |the_actor|
  if the_actor.movies.count > top_actor.movies.count
    top_actor = the_actor
  end

  end
  @actor_with_the_most_movies = top_actor.name
  end




  def question_5
    # This one is hard. Work on it after all your other review is complete.

    # Which actor/director pair has the most movies on the list?
    # (If there's a tie, any pair of them is fine)

    # Your Ruby goes here.

    # @actor = ???
    # @director = ???
    # @movies_together = ???
  end
 end
