# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  {name: 'Steve', email: 'stephen.lead@gmail.com', password: 'password', id: 1},
  {name: 'Gloria', email: 'tonggsy@gmail.com', password: 'password', id: 2}
  ])

cafes = Cafe.create!([
  
  {
    name: 'Ace Hotel Lobby Bar',
    address: '16 W 29th St, New York, NY',
    description: 'Free Wi-Fi. Plugs around the communal tables. Grab your coffee at Stumptown Coffee Roasters near the entrance on 29th',
    user_id: 1
  },
  {
    name: 'Brooklyn Roasting Company',
    address: '25 Jay St, Brooklyn, NY',
    description: 'Plugs scattered about. (As of Mar 2014) Wi-Fi Network: Brooklyn Wi-Fi password): Roasting',
    user_id: 1
  },
  {
    name: 'Think Coffee Shop',
    address: '248 Mercer St, New York, NY',
    description: 'Plugs scattered around the walls, behind the tables. Wi-Fi Password: Think',
    user_id: 2
  },
  {
    name: 'Telegraph Cafe',
    address: '107 W 18th St, New York, NY',
    description: 'Plugs behind every table. Wi-Fi password: 2124885810',
    user_id: 1
  },
  {
    name: 'Black Brick',
    address: '300 Bedford Ave, Brooklyn, NY',
    description: 'Lots of outlets and plenty of seats. Wi-Fi password: extrashot',
    user_id: 2
  },
  {
    name: 'Variety Coffee Shop',
    address: '368 Graham Ave, Brooklyn, NY',
    description: 'Plenty of outlets. Free Wi-Fi, ask for password at the counter',
    user_id: 2
  },
  {
    name: 'Atlas Cafe',
    address: '116 Havemeyer St, Brooklyn, NY',
    description: 'Plenty of outlets. Free Wi-Fi, ask for password at the counter',
    user_id: 1
  },
  {
    name: 'Wired Puppy',
    address: '250 Newbury St, Boston, MA', 
    description: 'Outlets everywhere. Computers for use. Wi-Fi password Wired',
    user_id: 1
  },
  {
    name: 'Render Coffee',
    address: '563 Columbus Ave, Boston, MA',
    description: 'Lots of outlets near tables. Wi-Fi password: coffeetime',
    user_id: 2
  },
  {
    name: 'Equal Exchange Cafe',
    address: '226 Causeway St, Boston, MA',
    description: 'Plugs along the walls. Wi-Fi password: fair trade',
    user_id: 2
  }

  ])

