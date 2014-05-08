# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

team_a = Team.create!(team_name: "Team A", player1_name: "Rachel", player2_name: "Zlat", created_at: "2014-05-03 23:13:26", updated_at: "2014-05-03 23:13:26", avatar1_file_name: "1.jpg", avatar1_content_type: "image/jpeg", avatar1_file_size: 45132, avatar1_updated_at: "2014-05-03 23:13:26", avatar2_file_name: "2.jpg", avatar2_content_type: "image/jpeg", avatar2_file_size: 39591, avatar2_updated_at: "2014-05-03 23:13:26")
team_b = Team.create!(team_name: "Team B", player1_name: "Ian", player2_name: "Taha", created_at: "2014-05-03 23:39:52", updated_at: "2014-05-03 23:39:52", avatar1_file_name: "ian.JPG", avatar1_content_type: "image/jpeg", avatar1_file_size: 559657, avatar1_updated_at: "2014-05-03 23:39:51", avatar2_file_name: "IMG_20140201_210354_2.jpg", avatar2_content_type: "image/jpeg", avatar2_file_size: 339921, avatar2_updated_at: "2014-05-03 23:39:52")
team_c = Team.create!(team_name: "Team C", player1_name: "Sanborn", player2_name: "Dominique", created_at: "2014-05-04 01:29:28", updated_at: "2014-05-04 01:29:28", avatar1_file_name: "sanborn.JPG", avatar1_content_type: "image/jpeg", avatar1_file_size: 623304, avatar1_updated_at: "2014-05-04 01:29:26", avatar2_file_name: "dom.JPG", avatar2_content_type: "image/jpeg", avatar2_file_size: 555781, avatar2_updated_at: "2014-05-04 01:29:27")
team_d = Team.create!(team_name: "Team D", player1_name: "Adriana", player2_name: "Richard", created_at: "2014-05-04 01:32:16", updated_at: "2014-05-04 01:32:16", avatar1_file_name: "adriana.JPG", avatar1_content_type: "image/jpeg", avatar1_file_size: 619744, avatar1_updated_at: "2014-05-04 01:32:15", avatar2_file_name: "richard.JPG", avatar2_content_type: "image/jpeg", avatar2_file_size: 614228, avatar2_updated_at: "2014-05-04 01:32:15")
team_a = Team.create!(team_name: "Team A", player1_name: "Rachel", player2_name: "Zlat", created_at: "2014-05-03 23:13:26", updated_at: "2014-05-03 23:13:26", avatar1_file_name: "1.jpg", avatar1_content_type: "image/jpeg", avatar1_file_size: 45132, avatar1_updated_at: "2014-05-03 23:13:26", avatar2_file_name: "2.jpg", avatar2_content_type: "image/jpeg", avatar2_file_size: 39591, avatar2_updated_at: "2014-05-03 23:13:26")
team_b = Team.create!(team_name: "Team B", player1_name: "Ian", player2_name: "Taha", created_at: "2014-05-03 23:39:52", updated_at: "2014-05-03 23:39:52", avatar1_file_name: "ian.JPG", avatar1_content_type: "image/jpeg", avatar1_file_size: 559657, avatar1_updated_at: "2014-05-03 23:39:51", avatar2_file_name: "IMG_20140201_210354_2.jpg", avatar2_content_type: "image/jpeg", avatar2_file_size: 339921, avatar2_updated_at: "2014-05-03 23:39:52")
team_c = Team.create!(team_name: "Team C", player1_name: "Sanborn", player2_name: "Dominique", created_at: "2014-05-04 01:29:28", updated_at: "2014-05-04 01:29:28", avatar1_file_name: "sanborn.JPG", avatar1_content_type: "image/jpeg", avatar1_file_size: 623304, avatar1_updated_at: "2014-05-04 01:29:26", avatar2_file_name: "dom.JPG", avatar2_content_type: "image/jpeg", avatar2_file_size: 555781, avatar2_updated_at: "2014-05-04 01:29:27")

# ping_pong_game_1 = PingPong.create!(team_1_id: team_a.id, team_2_id: team_b.id, team_1_score: 15, team_2_score: 16)
# ping_pong_game_2 = PingPong.create!(team_1_id: team_c.id, team_2_id: team_d.id, team_1_score: 5, team_2_score: 16)
# fuzzball_game_1 = FuzzBall.create!(team_1_id: team_a.id, team_2_id: team_b.id, team_1_score: 6, team_2_score: 5)
# fuzzball_game_2 = FuzzBall.create!(team_1_id: team_c.id, team_2_id: team_d.id, team_1_score: 3, team_2_score: 7)
