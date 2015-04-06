User.create!([
  {email: "ngcarson@gmail.com", encrypted_password: "$2a$10$lSHMARIlCB0Go9ySkYi3juacjURPnECC4oYEnWZGR8I6J2u2RTKEG", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 4, current_sign_in_at: "2015-04-06 11:02:57", last_sign_in_at: "2015-04-06 10:20:34", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "Carson", last_name: "Gonzales", username: "ngcarson83", provider: nil, uid: nil},
  {email: "tdroid12345@gmail.com", encrypted_password: "$2a$10$PPwam2o/CxKE4SFuKGqxAO5omE5KFIETwD/h2B8xl1dDPdr2ts7ae", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2015-04-06 10:18:00", last_sign_in_at: "2015-04-06 10:17:45", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: nil, last_name: nil, username: nil, provider: "google_oauth2", uid: "103166982178313969944"}
])
Comment.create!([
  {comment: "Test 1", idea_id: 2, user_id: 1},
  {comment: "Test 2", idea_id: 2, user_id: 1},
  {comment: "Test 3", idea_id: 2, user_id: 1},
  {comment: "Hello 1", idea_id: 3, user_id: 1},
  {comment: "Hello 2", idea_id: 3, user_id: 1},
  {comment: "Hello 3", idea_id: 3, user_id: 1}
])
Idea.create!([
  {Idea: "Philippines Trip", Destination: "Manila", Start: "2015-04-06", End: "2015-05-31", Tags: "Manila, Philippines", user_id: 1, image_file_name: "manila.jpg", image_content_type: "image/jpeg", image_file_size: 59590, image_updated_at: "2015-04-06 09:52:28", latitude: 14.5995124, longitude: 120.9842195},
  {Idea: "Paris Trip", Destination: "Paris", Start: "2015-05-06", End: "2015-07-31", Tags: "Paris, France", user_id: 1, image_file_name: "paris.jpg", image_content_type: "image/jpeg", image_file_size: 541346, image_updated_at: "2015-04-06 09:52:51", latitude: 48.856614, longitude: 2.3522219},
  {Idea: "Germany Trip", Destination: "Berlin", Start: "2015-07-06", End: "2015-08-31", Tags: "Berlin, Germany", user_id: 1, image_file_name: "berlin.jpg", image_content_type: "image/jpeg", image_file_size: 257482, image_updated_at: "2015-04-06 10:16:26", latitude: 52.52000659999999, longitude: 13.404954},
  {Idea: "Israel Trip", Destination: "Israel", Start: "2015-09-06", End: "2015-10-31", Tags: "Israel", user_id: 1, image_file_name: "israel.jpg", image_content_type: "image/jpeg", image_file_size: 114235, image_updated_at: "2015-04-06 10:16:49", latitude: 31.046051, longitude: 34.851612},
  {Idea: "LA Trip", Destination: "Los Angeles", Start: "2015-11-06", End: "2015-12-06", Tags: "LA, California", user_id: 2, image_file_name: "la.jpg", image_content_type: "image/jpeg", image_file_size: 57691, image_updated_at: "2015-04-06 10:18:48", latitude: 34.0522342, longitude: -118.2436849},
  {Idea: "NYC Trip", Destination: "New York", Start: "2015-05-06", End: "2015-06-06", Tags: "New York, NYC", user_id: 2, image_file_name: "nyc.jpg", image_content_type: "image/jpeg", image_file_size: 196094, image_updated_at: "2015-04-06 10:19:30", latitude: 40.7127837, longitude: -74.0059413},
  {Idea: "Spain Trip", Destination: "Madrid", Start: "2015-03-06", End: "2015-04-06", Tags: "Madrid, Spain", user_id: 1, image_file_name: "madrid.jpeg", image_content_type: "image/jpeg", image_file_size: 34604, image_updated_at: "2015-04-06 10:21:01", latitude: 40.4167754, longitude: -3.7037902},
  {Idea: "OZ Trip", Destination: "Sydney", Start: "2015-05-10", End: "2015-07-31", Tags: "Sydney, Australia", user_id: 1, image_file_name: "sydney.jpg", image_content_type: "image/jpeg", image_file_size: 93091, image_updated_at: "2015-04-06 11:03:45", latitude: nil, longitude: nil},
  {Idea: "Russia Tour", Destination: "Moscow", Start: "2015-07-06", End: "2015-07-31", Tags: "Moscow, Russia", user_id: 1, image_file_name: "moscow.jpg", image_content_type: "image/jpeg", image_file_size: 82301, image_updated_at: "2015-04-06 11:14:18", latitude: 55.755826, longitude: 37.6173},
  {Idea: "Shanghai Tour", Destination: "Shanghai", Start: "2015-12-06", End: "2015-12-31", Tags: "Shanghai, China", user_id: 1, image_file_name: "shanghai.jpg", image_content_type: "image/jpeg", image_file_size: 104969, image_updated_at: "2015-04-06 11:13:46", latitude: 31.230416, longitude: 121.473701},
  {Idea: "Beijing Tour", Destination: "Beijing", Start: "2015-09-06", End: "2015-09-30", Tags: "Beijing, China", user_id: 1, image_file_name: "beijing.JPG", image_content_type: "image/jpeg", image_file_size: 129373, image_updated_at: "2015-04-06 11:13:23", latitude: 39.904211, longitude: 116.407395}
])
