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

users = User.create([{user_id: 'f912b2e9f764ac031f137f6ecf84ebca',
                      username: 'deangiberson',
                      email: 'dean@deangiberson.com',
                      timezone: 'America/Vancouver',
                      plan: 0,
                      profile: profiles.first,
                      created_at: "2016-03-17 06:22:42",
                      updated_at: "2016-03-17 06:22:42"},
                     {user_id: '88144fc51182cfa77a6ddae039dab97a',
                      username: 'testpublic',
                      email: 'test@deangiberson.com',
                      timezone: 'America/Vancouver',
                      plan: 0,
                      profile: profiles.last,
                      created_at: "2016-03-17 06:22:42",
                      updated_at: "2016-03-17 06:22:42"},
                     {user_id: 'a3ae63b5b8dfffe8a18680b467d5d1da',
                      username: 'testpublic',
                      email: 'test@deangiberson.com',
                      timezone: 'America/Vancouver',
                      plan: 0,
                      profile: profiles.first,
                      created_at: "2016-03-17 06:22:42",
                      updated_at: "2016-03-17 06:22:42"}])

p users

apikeys = ApiKey.create([{user: users[0],
                          created_at: "2016-03-17 06:22:42",
                          updated_at: "2016-03-17 06:22:42"},
                         {user: users[1],
                          created_at: "2016-03-17 06:22:42",
                          updated_at: "2016-03-17 06:22:42"},
                         {user: users[2],
                          created_at: "2016-03-17 06:22:42",
                          updated_at: "2016-03-17 06:22:42"}])

# Forcing these accoutns to have fixed api keys to ease testing
apikeys[0].update_attribute("access_token", "f912b2e9f764ac031f137f6ecf84ebca")
apikeys[1].update_attribute("access_token", "88144fc51182cfa77a6ddae039dab97a")
apikeys[2].update_attribute("access_token", "a3ae63b5b8dfffe8a18680b467d5d1da")

# apikeys.each |a| a.save!

p apikeys

durations = Duration.create([{user: users[0],
                              project: 'project',
                              time: '1459226847',
                              duration: 10,
                              branch: 'branch1',
                              created_at: "2016-03-17 06:22:42",
                              updated_at: "2016-03-17 06:22:42"},
                             {user: users[0],
                              project: 'project2',
                              time: '1459226847',
                              duration: 10,
                              branch: 'branch2',
                              created_at: "2016-03-17 06:22:42",
                              updated_at: "2016-03-17 06:22:42"},
                             {user: users[1],
                              project: 'project',
                              time: '1459226847',
                              duration: 10,
                              branch: 'branch1',
                              created_at: "2016-03-17 06:22:42",
                              updated_at: "2016-03-17 06:22:42"}])

heartbeats = Heartbeat.create([{user: users[0],
                                entity: 'entity',
                                entity_type: 'type',
                                time: 1459226847,
                                project: 'project1',
                                branch: 'branch1',
                                language: 'lang',
                                dependencies: 'dep',
                                lines: 10,
                                lineno: 101,
                                cursorpos: 9,
                                is_write: true,
                                is_debugging: false,
                                created_at: "2016-03-17 06:22:42",
                                updated_at: "2016-03-17 06:22:42"}])

leaders = Leader.create([{user: users[0],
                          rank: 1},
                         {user: users[1],
                          rank: 2},
                         {user: users[2],
                          rank: 3}])

running_totals = RunningTotal.create([{leader: leaders[0],
                                       total_seconds: 10,
                                       daily_average: 10},
                                      {leader: leaders[1],
                                       total_seconds: 9,
                                       daily_average: 9},
                                      {leader: leaders[2],
                                       total_seconds: 8,
                                       daily_average: 8}])

