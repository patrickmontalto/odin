require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	describe "GET #index" do
		it "responds successfully with an HTTP 200 status code" do
			get :index
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "renders the index template" do
			get :index
			expect(response).to render_template("index")
		end

		it "loads all of the users" do
			user = User.create!(:name => "jdoe", :password => "admin", :email => "jdoe@doe.com")
			get "/login"
			assert_select "form.login" do
				assert_select "input[name=?]", "email"
				assert_select "input[name=?]", "password"
				assert_select "input[type=?]", "submit"
			end

			post "/login", :email => "jdoe@doe.com", :password => "admin"
			assert_select 

		end
	end

end
