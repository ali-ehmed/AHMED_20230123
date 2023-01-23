puts 'Creating categories...'
exercise_category = Category.find_or_create_by!(name: "Exercise")
education_category = Category.find_or_create_by!(name: "Education")
recipe_category = Category.find_or_create_by!(name: "Recipe")

Video.destroy_all

puts 'Creating videos...'
exercise_video = Video.new(title: 'FEARS - Motivational Workout Video', category: exercise_category)
exercise_video.clip.attach(io: File.open('./db/data/FEARS_Motivational_Workout_Video.mp4'), filename: 'FEARS_Motivational_Workout_Video')
exercise_video.save!

exercise_2_video = Video.new(title: 'QUICK STRETCH & COOL DOWN FOR KIDS', category: exercise_category)
exercise_2_video.clip.attach(io: File.open('./db/data/QUICK_STRETCH_&_COOL_DOWN_FOR_KIDS.mp4'), filename: 'QUICK_STRETCH_&_COOL_DOWN_FOR_KIDS')
exercise_2_video.save!

exercise_3_video = Video.new(title: 'Ergonomics exercise', category: exercise_category)
exercise_3_video.clip.attach(io: File.open('./db/data/Ergonomics exercise.mp4'), filename: 'Ergonomics_exercise')
exercise_3_video.save!

exercise_4_video = Video.new(title: 'Stretch at your desk', category: exercise_category)
exercise_4_video.clip.attach(io: File.open('./db/data/Stretch at your desk.mp4'), filename: 'Stretch at your desk')
exercise_4_video.save!

education_video = Video.new(title: 'Education for life', category: education_category)
education_video.clip.attach(io: File.open('./db/data/Education_For_Life.mp4'), filename: 'education_for_life')
education_video.save!

education_2_video = Video.new(title: 'THE SEED Inspirational Short Film', category: education_category)
education_2_video.clip.attach(io: File.open('./db/data/THE SEED Inspirational Short Film.mp4'), filename: 'THE_SEED_Inspirational_Short_Film')
education_2_video.save!

education_3_video = Video.new(title: 'Importance of Education for children', category: education_category)
education_3_video.clip.attach(io: File.open('./db/data/Importance of Education for children.mp4'), filename: 'Importance of Education for children')
education_3_video.save!

education_4_video = Video.new(title: 'Good teamwork and bad teamwork', category: education_category)
education_4_video.clip.attach(io: File.open('./db/data/Good teamwork and bad teamwork.mp4'), filename: 'Good teamwork and bad teamwork')
education_4_video.save!

recipe_video = Video.new(title: '4 easy meals to start cooking', category: recipe_category)
recipe_video.clip.attach(io: File.open('./db/data/4_Easy_Meals_To_Start_Cooking.mov'), filename: '4_easy_meals_to_start_cooking')
recipe_video.save!

recipe_2_video = Video.new(title: 'Most Satisfying Food Recipes', category: recipe_category)
recipe_2_video.clip.attach(io: File.open('./db/data/Most Satisfying Food Recipes Amazing Short Cooking Videos.mp4'), filename: 'Most_Satisfying_Food_Recipes_Amazing_Short_Cooking_Videos')
recipe_2_video.save!

recipe_3_video = Video.new(title: 'Food Film - Cinematic Burger', category: recipe_category)
recipe_3_video.clip.attach(io: File.open('./db/data/Food Film Cinematic Burger.mp4'), filename: 'Food_Film_Cinematic_Burger')
recipe_3_video.save!

recipe_4_video = Video.new(title: 'Chocolate Macarons Recipe', category: recipe_category)
recipe_4_video.clip.attach(io: File.open('./db/data/Chocolate Macarons Recipe.mp4'), filename: 'Chocolate Macarons Recipe')
recipe_4_video.save!
