# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

users_list = [
  [ "Louranda", "https://png.pngtree.com/element_our/png_detail/20181026/woman-avatar-professional-icon-woman-flat-icon-woman-avatar-woman-character-png_219870.jpg" ],
  [ "Natali", "https://png.pngtree.com/element_our/png_detail/20181026/woman-avatar-professional-icon-woman-flat-icon-woman-avatar-woman-character-png_219870.jpg" ],
  [ "kariena", "https://png.pngtree.com/element_our/png_detail/20181026/woman-avatar-professional-icon-woman-flat-icon-woman-avatar-woman-character-png_219870.jpg" ],
  [ "Yussina", "https://png.pngtree.com/element_our/png_detail/20181026/woman-avatar-professional-icon-woman-flat-icon-woman-avatar-woman-character-png_219870.jpg" ],
  [ "Yanni", "https://www.atlassian.com/dam/jcr:13a574c1-390b-4bfb-956b-6b6d114bf98c/max-rehkopf.png" ],
  [ "Flource", "https://www.atlassian.com/dam/jcr:13a574c1-390b-4bfb-956b-6b6d114bf98c/max-rehkopf.png" ],
  [ "Adriane", "https://www.atlassian.com/dam/jcr:13a574c1-390b-4bfb-956b-6b6d114bf98c/max-rehkopf.png" ],
  [ "Danielo", "https://www.atlassian.com/dam/jcr:13a574c1-390b-4bfb-956b-6b6d114bf98c/max-rehkopf.png" ],[ "Loura", "https://png.pngtree.com/element_our/png_detail/20181026/woman-avatar-professional-icon-woman-flat-icon-woman-avatar-woman-character-png_219870.jpg" ],
  [ "Natalie", "https://png.pngtree.com/element_our/png_detail/20181026/woman-avatar-professional-icon-woman-flat-icon-woman-avatar-woman-character-png_219870.jpg" ],
  [ "karien", "https://png.pngtree.com/element_our/png_detail/20181026/woman-avatar-professional-icon-woman-flat-icon-woman-avatar-woman-character-png_219870.jpg" ],
  [ "Yussi", "https://png.pngtree.com/element_our/png_detail/20181026/woman-avatar-professional-icon-woman-flat-icon-woman-avatar-woman-character-png_219870.jpg" ],
  [ "Yannick", "https://www.atlassian.com/dam/jcr:13a574c1-390b-4bfb-956b-6b6d114bf98c/max-rehkopf.png" ],
  [ "Flouran", "https://www.atlassian.com/dam/jcr:13a574c1-390b-4bfb-956b-6b6d114bf98c/max-rehkopf.png" ],
  [ "Adrian", "https://www.atlassian.com/dam/jcr:13a574c1-390b-4bfb-956b-6b6d114bf98c/max-rehkopf.png" ],
  [ "Daniel", "https://www.atlassian.com/dam/jcr:13a574c1-390b-4bfb-956b-6b6d114bf98c/max-rehkopf.png" ],
  [ "Lourita", "https://png.pngtree.com/element_our/png_detail/20181026/woman-avatar-professional-icon-woman-flat-icon-woman-avatar-woman-character-png_219870.jpg" ],
  [ "Natala", "https://png.pngtree.com/element_our/png_detail/20181026/woman-avatar-professional-icon-woman-flat-icon-woman-avatar-woman-character-png_219870.jpg" ],
  [ "karienna", "https://png.pngtree.com/element_our/png_detail/20181026/woman-avatar-professional-icon-woman-flat-icon-woman-avatar-woman-character-png_219870.jpg" ],
  [ "Yussina", "https://png.pngtree.com/element_our/png_detail/20181026/woman-avatar-professional-icon-woman-flat-icon-woman-avatar-woman-character-png_219870.jpg" ],
  [ "Yannis", "https://www.atlassian.com/dam/jcr:13a574c1-390b-4bfb-956b-6b6d114bf98c/max-rehkopf.png" ],
  [ "Flourate", "https://www.atlassian.com/dam/jcr:13a574c1-390b-4bfb-956b-6b6d114bf98c/max-rehkopf.png" ],
  [ "Adria", "https://www.atlassian.com/dam/jcr:13a574c1-390b-4bfb-956b-6b6d114bf98c/max-rehkopf.png" ],
  [ "Danie", "https://www.atlassian.com/dam/jcr:13a574c1-390b-4bfb-956b-6b6d114bf98c/max-rehkopf.png" ],
  [ "Sophies", "https://png.pngtree.com/element_our/png_detail/20181026/woman-avatar-professional-icon-woman-flat-icon-woman-avatar-woman-character-png_219870.jpg" ]
]

users_list.each do |name, image_url|
  User.create( name: name, image_url: image_url )
end

#Create 30 posts each for the first 20 users
users = User.order(:created_at).take(20)
30.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.posts.create!(body: content) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..12]
followers = users[3..18]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
