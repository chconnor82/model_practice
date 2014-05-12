class QuestionsController < ApplicationController
  def question_1
    # What is the most recent movie on the list that the second actor appeared in?

    # Your Ruby goes here.
    @the_actor = Actor.second.id
    @movies_for_the_second_actor = Movie.where(:the_actor.movies.count => @the_actor)
    @most_recent_movie_for_second_actor = Actor.second.movies.order("year DESC").first
  end

  def question_2
    # Who directed the longest movie on the list?

    the_longest_movie_director_id = Movie.order("duration ASC").last.director_id
    Director.find(the_longest_movie_director_id).name
    @director_of_longest_movie.name = Movie.order("duration DESC").first.director
  end

  def question_3
    # Which director has the most movies on the list?

    # movie_counts = {}
    the_leader = Director.new
    Director.all.each do |the_director|
    # movie_counts[the_director.movies] = the_director.movies.count
    if the_director.movies.count > top_director.movies.count
    the_leader = the_director
  end
end
  # @most_number_of_movies_by_a_single_director = movie_counts.sort
  @director_with_the_most_movies = the_leader

  end

    @director_with_the_most_movies = top_director.name

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
    most_movies_together = 0
     @actor = nil
     @director = nil

     Actor.all.each do |actor|
       this_actors_most_movies_with_one_director = 0
       this_actors_favorite_director = nil

       actor.movies.each do |movie|
         number_of_movies_with_same_director_as_this_one = actor.movies.where(:director_id => movie.director_id).count

         if this_actors_most_movies_with_one_director < number_of_movies_with_same_director_as_this_one
           this_actors_most_movies_with_one_director = number_of_movies_with_same_director_as_this_one
           this_actors_favorite_director = movie.director
         end
       end

       if most_movies_together < this_actors_most_movies_with_one_director
         most_movies_together = this_actors_most_movies_with_one_director
         @director = this_actors_favorite_director
         @actor = actor
       end
     end

     @movies_together = @actor.movies.where(:director_id => @director.id)
    end
  end

  end
 end
