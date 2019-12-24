puts 'Generating Seeds'

def seed_admin
  User.create!(
    email: 'admin@admin.com',
    password: 'password',
    username: 'Admin',
    role: 'admin'
  )
end

def seed_users
  users = []

  3.times do |user|
    users << User.create!(
      email: "user_#{user}@user.com",
      password: 'password',
      username: "User_#{user}",
      role: 'user'
    )
  end

  users
end

def seed_languages
  ruby = Language.create!(name: 'Ruby')
  javascript = Language.create!(name: 'Javascript')
  python = Language.create!(name: 'Python')

  [ruby, javascript, python]
end

def seed_challenges(languages, users)
  10.times do |challenge|
    challenge += 1
    new_challenge = Challenge.new(
      title: "Challenge ##{challenge}",
      gist: 'https://via.placeholder.com/500x600',
      description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa nesciunt nihil aut nostrum explicabo reprehenderit optio amet ab temporibus asperiores quasi cupiditate. Voluptatum ducimus voluptates voluptas?'
    )

    new_challenge.language = languages.sample
    new_challenge.save!
  end
end

def seed
  seed_admin
  puts 'Seeded Admin'

  users = seed_users
  puts 'Seeded Users'

  languages = seed_languages
  puts 'Seeded Languages'

  seed_challenges(languages, users)
  puts 'Seeded Challenges'
end

seed
