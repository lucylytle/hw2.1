# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
# TODO!

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

new_studio = Studio.new
new_studio["name"] = "Warner Bros."
new_studio.save

warnerbros = Studio.find_by({ "name" => "Warner Bros." })

new_movie = Movie.new
new_movie["title"] = "Batman Begins"
new_movie["year_released"] = 2005
new_movie["rated"] = "PG-13"
new_movie["studio_id"] = warnerbros["id"]
new_movie.save

new_movie2 = Movie.new
new_movie2["title"] = "The Dark Knight"
new_movie2["year_released"] = 2008
new_movie2["rated"] = "PG-13"
new_movie2["studio_id"] = warnerbros["id"]
new_movie2.save

new_movie3 = Movie.new
new_movie3["title"] = "The Dark Knight Rises"
new_movie3["year_released"] = 2012
new_movie3["rated"] = "PG-13"
new_movie3["studio_id"] = warnerbros["id"]
new_movie3.save

#puts "Movies: #{Movie.all.count}"

new_actor = Actor.new
new_actor["name"] = "Christian Bale"
new_actor.save

new_actor2 = Actor.new
new_actor2["name"] = "Michael Caine"
new_actor2.save

new_actor3 = Actor.new
new_actor3["name"] = "Liam Neeson"
new_actor3.save

new_actor4 = Actor.new
new_actor4["name"] = "Katie Holmes"
new_actor4.save

new_actor5 = Actor.new
new_actor5["name"] = "Gary Oldman"
new_actor5.save

new_actor6 = Actor.new
new_actor6["name"] = "Heath Ledger"
new_actor6.save

new_actor7 = Actor.new
new_actor7["name"] = "Aaron Eckhart"
new_actor7.save

new_actor8 = Actor.new
new_actor8["name"] = "Maggie Gyllenhaal"
new_actor8.save

new_actor9 = Actor.new
new_actor9["name"] = "Tom Hardy"
new_actor9.save

new_actor10 = Actor.new
new_actor10["name"] = "Joseph Gordon-Levitt"
new_actor10.save

new_actor11 = Actor.new
new_actor11["name"] = "Anne Hathaway"
new_actor11.save

#puts "Actors: #{Actor.all.count}"

#Batman Begins Roles
new_role = Role.new
new_role["movie_id"] = Movie.find_by({ "title" => "Batman Begins" })["id"]
new_role["actor_id"] = Actor.find_by({ "name" => "Christian Bale" })["id"]
new_role["character_name"] = "Bruce Wayne"
new_role.save

new2_role = Role.new
new2_role["movie_id"] = Movie.find_by({ "title" => "Batman Begins" })["id"]
new2_role["actor_id"] = Actor.find_by({ "name" => "Michael Caine" })["id"]
new2_role["character_name"] = "Alfred"
new2_role.save

new3_role = Role.new
new3_role["movie_id"] = Movie.find_by({ "title" => "Batman Begins" })["id"]
new3_role["actor_id"] = Actor.find_by({ "name" => "Liam Neeson" })["id"]
new3_role["character_name"] = "Ra's Al Ghul"
new3_role.save

new4_role = Role.new
new4_role["movie_id"] = Movie.find_by({ "title" => "Batman Begins" })["id"]
new4_role["actor_id"] = Actor.find_by({ "name" => "Katie Holmes" })["id"]
new4_role["character_name"] = "Rachel Dawes"
new4_role.save

new5_role = Role.new
new5_role["movie_id"] = Movie.find_by({ "title" => "Batman Begins" })["id"]
new5_role["actor_id"] = Actor.find_by({ "name" => "Gary Oldman" })["id"]
new5_role["character_name"] = "Commissioner Gordon"
new5_role.save

#Dark Knight Roles
new6_role = Role.new
new6_role["movie_id"] = Movie.find_by({ "title" => "The Dark Knight" })["id"]
new6_role["actor_id"] = Actor.find_by({ "name" => "Christian Bale" })["id"]
new6_role["character_name"] = "Bruce Wayne"
new6_role.save

new7_role = Role.new
new7_role["movie_id"] = Movie.find_by({ "title" => "The Dark Knight" })["id"]
new7_role["actor_id"] = Actor.find_by({ "name" => "Heath Ledger" })["id"]
new7_role["character_name"] = "Joker"
new7_role.save

new8_role = Role.new
new8_role["movie_id"] = Movie.find_by({ "title" => "The Dark Knight" })["id"]
new8_role["actor_id"] = Actor.find_by({ "name" => "Aaron Eckhart" })["id"]
new8_role["character_name"] = "Harvey Dent"
new8_role.save

new9_role = Role.new
new9_role["movie_id"] = Movie.find_by({ "title" => "The Dark Knight" })["id"]
new9_role["actor_id"] = Actor.find_by({ "name" => "Michael Caine" })["id"]
new9_role["character_name"] = "Alfred"
new9_role.save

new10_role = Role.new
new10_role["movie_id"] = Movie.find_by({ "title" => "The Dark Knight" })["id"]
new10_role["actor_id"] = Actor.find_by({ "name" => "Maggie Gyllenhaal" })["id"]
new10_role["character_name"] = "Rachel Dawes"
new10_role.save

#Dark Knight Rises Roles
new11_role = Role.new
new11_role["movie_id"] = Movie.find_by({ "title" => "The Dark Knight Rises" })["id"]
new11_role["actor_id"] = Actor.find_by({ "name" => "Christian Bale" })["id"]
new11_role["character_name"] = "Bruce Wayne"
new11_role.save

new12_role = Role.new
new12_role["movie_id"] = Movie.find_by({ "title" => "The Dark Knight Rises" })["id"]
new12_role["actor_id"] = Actor.find_by({ "name" => "Gary Oldman" })["id"]
new12_role["character_name"] = "Commissioner Gordon"
new12_role.save

new13_role = Role.new
new13_role["movie_id"] = Movie.find_by({ "title" => "The Dark Knight Rises" })["id"]
new13_role["actor_id"] = Actor.find_by({ "name" => "Tom Hardy" })["id"]
new13_role["character_name"] = "Bane"
new13_role.save

new14_role = Role.new
new14_role["movie_id"] = Movie.find_by({ "title" => "The Dark Knight Rises" })["id"]
new14_role["actor_id"] = Actor.find_by({ "name" => "Joseph Gordon-Levitt" })["id"]
new14_role["character_name"] = "John Blake"
new14_role.save

new15_role = Role.new
new15_role["movie_id"] = Movie.find_by({ "title" => "The Dark Knight Rises" })["id"]
new15_role["actor_id"] = Actor.find_by({ "name" => "Anne Hathaway" })["id"]
new15_role["character_name"] = "Selina Kyle"
new15_role.save

#puts "Roles: #{Role.all.count}"

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

movies = Movie.all
studios = Studio.all

for movie in movies 
title = movie["title"]
year_released = movie["year_released"]
rated = movie["rated"]
studio = Studio.find_by({"id" => movie["studio_id"]})["name"]
p "#{title} #{year_released} #{rated} #{studio}"
end 

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

roles = Role.all
for role in roles
title = Movie.find_by({"id" => role["movie_id"]})["title"]
actor = Actor.find_by({"id" => role["actor_id"]})["name"]
character_name = role["character_name"]
p "#{title} #{actor} #{character_name}"
end 