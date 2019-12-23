puts 'Generating Seeds'

ruby = Language.create!(name: 'Ruby')
javascript = Language.create!(name: 'Javascript')
python = Language.create!(name: 'Python')

languages = [ruby, javascript, python]

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

puts 'Created 10 Challenges'
