exercise_category = Category.find_or_create_by!(name: "Exercise")
education_category = Category.find_or_create_by!(name: "Education")
recipe_category = Category.find_or_create_by!(name: "Recipe")

exercise_video = Video.find_or_initialize_by(title: '10 Exercises for kids', category: exercise_category)
exercise_video.clip.attach(io: File.open('./db/data/10_EXERCISES_FOR_KIDS.mp4'), filename: '10_EXERCISES_FOR_KIDS') unless exercise_video.clip.attached?
exercise_video.save!

education_video = Video.find_or_initialize_by(title: '4 easy meals to start cooking', category: education_category)
education_video.clip.attach(io: File.open('./db/data/Education_For_Life.mp4'), filename: 'education_for_life') unless education_video.clip.attached?
education_video.save!

recipe_video = Video.find_or_initialize_by(title: '4 easy meals to start cooking', category: recipe_category)
recipe_video.clip.attach(io: File.open('./db/data/4_Easy_Meals_To_Start_Cooking.mov'), filename: '4_easy_meals_to_start_cooking') unless recipe_video.clip.attached?
recipe_video.save!
