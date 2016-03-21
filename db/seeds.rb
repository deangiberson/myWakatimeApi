# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
profiles = Profile.create([{logged_time_public: false,
                            languages_used_public: false,
                            email_public: false,
                            photo_public: false},
                           {logged_time_public: true,
                            languages_used_public: true,
                            email_public: true,
                            photo_public: true}])

users = User.create([{username: 'deangiberson',
                      email: 'dean@deangiberson.com',
                      timezone: 'America/Vancouver',
                      plan: 0,
                      profile: profiles.first,
                      created_at: "2016-03-17 06:22:42",
                      updated_at: "2016-03-17 06:22:42"},
                     {username: 'testpublic',
                      email: 'test@deangiberson.com',
                      timezone: 'America/Vancouver',
                      plan: 0,
                      profile: profiles.last,
                      created_at: "2016-03-17 06:22:42",
                      updated_at: "2016-03-17 06:22:42"},
                     {username: 'testpublic',
                      email: 'test@deangiberson.com',
                      timezone: 'America/Vancouver',
                      plan: 0,
                      profile: profiles.first,
                      created_at: "2016-03-17 06:22:42",
                      updated_at: "2016-03-17 06:22:42"}])

p users

apikey = ApiKey.create([{user: users[0],
                         created_at: "2016-03-17 06:22:42",
                         updated_at: "2016-03-17 06:22:42"},
                        {user: users[1],
                         created_at: "2016-03-17 06:22:42",
                         updated_at: "2016-03-17 06:22:42"},
                        {user: users[2],
                         created_at: "2016-03-17 06:22:42",
                         updated_at: "2016-03-17 06:22:42"}])

p apikey
