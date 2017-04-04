# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Card.destroy_all
Trip.destroy_all
Mood.destroy_all

User.create(id: 1, first_name: 'Michael',last_name: 'Da Vinci', email: 'dvm@mail.com',password: 'password');
Card.create(id: 1,image_url: 'http://webneel.com/daily/sites/default/files/images/daily/10-2013/2-mona-lisa-leonardo-da-vinci.jpg', lat: '45.444958', long: '12.328463', body: 'Mona My Baby', user_id: '1', trip_id: '1', country: 'Italy', city: 'Venice')
Trip.create(id:1,start_date: '24/2/1970', end_date: '26/3/1970', user_id:'1' ,name: 'Bon Voyage')
Mood.create(user_id:1,card_id:1)
