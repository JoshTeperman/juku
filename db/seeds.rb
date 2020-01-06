puts 'Generating Seeds'

def seed_admin
  User.create!(
    email: 'admin@example.com',
    password: 'password',
    username: 'Admin',
    role: 'admin'
  )
  puts 'Seeded Admin'
end

def seed_users
  users = []

  3.times do |user|
    user += 1
    users << User.create!(
      email: "user_#{user}@example.com",
      password: 'password',
      username: "User_#{user}",
      role: 'user'
    )
  end
  puts 'Seeded Users'

  users
end

def seed_languages
  ruby = Language.create!(name: 'Ruby')
  javascript = Language.create!(name: 'Javascript')
  python = Language.create!(name: 'Python')
  puts 'Seeded Languages'

  [ruby, javascript, python]
end

def seed_challenges(languages, users)
  challenges = []
  10.times do |challenge|
    challenge += 1
    new_challenge = Challenge.new(
      title: "Challenge ##{challenge}",
      gist: 'https://via.placeholder.com/500x600',
      description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa nesciunt nihil aut nostrum explicabo reprehenderit optio amet ab temporibus asperiores quasi cupiditate. Voluptatum ducimus voluptates voluptas?'
    )

    new_challenge.language = languages.sample
    new_challenge.user = users.sample
    new_challenge.save!
    challenges << new_challenge
  end
  puts 'Seeded Challenges'

  challenges
end

def seed_solutions(users, challenges)
  challenges.each do |challenge|
    users.each do |user|
      new_solution = Solution.new(
        gist: 'https://via.placeholder.com/400x500',
        description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa nesciunt?',
        language_id: challenge.language_id
      )
      new_solution.user = user
      new_solution.challenge = challenge
      new_solution.save!
    end
  end
  puts 'Seeded Solutions'
end

def seed
  seed_admin
  users = seed_users
  languages = seed_languages
  challenges = seed_challenges(languages, users)
  seed_solutions(users, challenges)
end

seed
