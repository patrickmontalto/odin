# app/script/rest_requestor.rb
require 'rest-client'
#url = "http://localhost:3000/users/1/edit"
#puts RestClient.get(url)

RestClient.post 'http://localhost:3000/users', :id => '2'