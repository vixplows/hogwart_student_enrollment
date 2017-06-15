require_relative('../models/house')
require_relative('../models/student')
require('pry-byebug')

house1 =  House.new({
  "name" => "Gryffindor",
  "url" => "https://vignette3.wikia.nocookie.net/harrypotter/images/9/96/Gryffindor_crest_by_tuliipiie-d491bqc.jpg/revision/latest?cb=20130508231701&format=original"
  })

house2 =  House.new({
  "name" => "Ravenclaw",
  "url" => "http://vignette3.wikia.nocookie.net/harrypotter/images/9/94/Ravenclaw_Logo.jpg/revision/latest?cb=20140627182803"
  })

house3 =  House.new({
  "name" => "Slytherin",
  "url" => "https://i.ytimg.com/vi/4y_-ArWJuQg/maxresdefault.jpg"
  })

house4 =  House.new({
  "name" => "Huffflepuff",
  "url" => "https://s-media-cache-ak0.pinimg.com/originals/e0/e2/bc/e0e2bca469b63385d89ec2f1250e4ca5.jpg"
  })

house1.save()
house2.save()
house3.save()
house4.save()

student1 = Student.new({
  "first_name" => "Harry",
  "second_name" => "Potter",
  "house_id" => house1.id,
  "age" => 15,
  "url" => "https://upload.wikimedia.org/wikipedia/en/4/44/HarryPotter5poster.jpg"
   })

student2 = Student.new({
  "first_name" => "Hermione",
  "second_name" => "Granger",
  "house_id" => house2.id,
  "age" => 14,
  "url" => "https://upload.wikimedia.org/wikipedia/en/d/d3/Hermione_Granger_poster.jpg"
   })

student1.save()
student2.save()

binding.pry
nil