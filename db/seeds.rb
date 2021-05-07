# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'Creating hobbies...'
reading = Hobby.new(name: "Reading")
reading.save!

cycling = Hobby.new(name: "Cycling")
cycling.save!

hiking = Hobby.new(name: "Hiking")
hiking.save!

sailing = Hobby.new(name: "Sailing")
sailing.save!

swimming = Hobby.new(name: "Swimming")
swimming.save!

videogames = Hobby.new(name: "Video games")
videogames.save!

walking = Hobby.new(name: "Walking")
walking.save!

flying = Hobby.new(name: "Flying")
flying.save!

writing = Hobby.new(name: "Writing")
writing.save!

painting = Hobby.new(name: "Painting")
painting.save!

mountainbiking = Hobby.new(name: "Mountain biking")
mountainbiking.save!

puts 'Finished!'



puts 'Creating genders...'

male = Gender.new(name: "Male")
male.save!

female = Gender.new(name: "Female")
female.save!

other = Gender.new(name: "Other")
other.save!

puts 'Finished!'



puts 'Creating price ranges...'
onetofifteen = Price.new(detail: "$1 - $15", from_price:1, to_price:2)
onetofifteen.save!

fifteentothirty = Price.new(detail: "$15 - $30", from_price:15, to_price:30)
fifteentothirty.save!

thirtytofifty = Price.new(detail: "$30 - $50", from_price:30, to_price:50)
thirtytofifty.save!

fiftytohundred = Price.new(detail: "$50 - $100", from_price:50, to_price:100)
fiftytohundred.save!

hundredtotwohundred = Price.new(detail: "$100 - $200", from_price:100, to_price:200)
hundredtotwohundred.save!

twohundredtofivehundred = Price.new(detail: "$200 - $500", from_price:200, to_price:500)
twohundredtofivehundred.save!

fivehundredtothousand = Price.new(detail: "$500 - $1000", from_price:500, to_price:1000)
fivehundredtothousand.save!

overthousand = Price.new(detail: "+$1000", from_price:1000, to_price:100000)
overthousand.save!

puts 'Finished!'




puts 'Creating relationships...'

girlfriend = Relationship.new(name: "Girlfriend")
girlfriend.save!

brother = Relationship.new(name: "Brother")
brother.save!

father = Relationship.new(name: "Father")
father.save!

mother = Relationship.new(name: "Mother")
mother.save!

sister = Relationship.new(name: "Sister")
sister.save!

bestfriend = Relationship.new(name: "Bestfriend")
bestfriend.save!

friend = Relationship.new(name: "Friend")
friend.save!

colleague = Relationship.new(name: "Colleague")
colleague.save!

brotherinlaw = Relationship.new(name: "Brother in Law")
brotherinlaw.save!

sisterinlaw = Relationship.new(name: "Sister in Law")
sisterinlaw.save!

motherinlaw = Relationship.new(name: "Mother in Law")
motherinlaw.save!

fatherinlaw = Relationship.new(name: "Father in Law")
fatherinlaw.save!

puts 'Finished!'




puts 'Creating age groups...'

zeroto12months = Age.new(details: "0 - 12 months", from_age:0, to_age:1)
zeroto12months.save!

onetothree = Age.new(details: "12 - 36 months", from_age:1, to_age:3)
onetothree.save!

threetosix = Age.new(details: "3 - 6 years old", from_age:3, to_age:6)
threetosix.save!

sixtoten = Age.new(details: "6 - 10 years old", from_age:6, to_age:10)
sixtoten.save!

tento13 = Age.new(details: "10 - 13 years old", from_age:10, to_age:13)
tento13.save!

thirteento18 = Age.new(details: "13 - 18 years old", from_age:13, to_age:18)
thirteento18.save!

eighteento25 = Age.new(details: "18 - 25 years old", from_age:18, to_age:25)
eighteento25.save!

twentyfiveto35 = Age.new(details: "25 - 35 years old", from_age:25, to_age:35)
twentyfiveto35.save!

thirtyfiveto50 = Age.new(details: "35 - 50 years old", from_age:35, to_age:50)
thirtyfiveto50.save!

fiftyto75 = Age.new(details: "50 - 75 years old", from_age:50, to_age:75)
fiftyto75.save!

over75 = Age.new(details: "+75 years old", from_age:75, to_age:150)
over75.save!

puts 'Finished'




puts 'Creating holidays...'

christmas = Holiday.new(name: "Christmas", date: "25th December", real_date: "2021/12/25")
christmas.save!

valentines = Holiday.new(name: "Valentines", date: "14th February", real_date: "2022/02/14")
valentines.save!

puts 'Finished'





puts 'Creating products...'

sportsbag = Product.new(name: "Sports bag", hobby_id:1, price:39, age:4)
sportsbag.save!

hockeystick = Product.new(name: "Hockey stick", hobby_id:5, price:14, age:3)
hockeystick.save!

ball = Product.new(name: "Ball", hobby_id:2, price:20, age:6)
ball.save!

boots = Product.new(name: "Hiking Boots", hobby_id:3, price:59, age:4)
boots.save!

puts 'Finished'
