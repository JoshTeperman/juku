puts 'Generating Seeds'

10.times do |challenge|
  challenge += 1
  Challenge.create!(
    title: "Challenge ##{challenge}",
    gist: 'https://via.placeholder.com/500x600',
    language: 'Ruby',
    description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa nesciunt nihil aut nostrum explicabo reprehenderit optio amet ab temporibus asperiores quasi cupiditate. Voluptatum ducimus voluptates voluptas?'
  )
end

puts 'Created 10 Challenges'
