puts 'Generating Seeds'

10.times do |challenge|
  Challenge.create!(
    title: "Challenge ##{challenge}",
    gist: 'https://via.placeholder.com/500x600',
    language: 'Ruby'
  )
end

puts 'Created 10 Challenges'
