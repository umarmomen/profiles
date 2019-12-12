require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	before do
		@tutee = User.create!(email: "usertest@berkeley.edu",
	      password_digest: "password",
	      name: "Test User",
	      major: "Film",
	      philosophy: "Film is the best major, but I teach CS anyway",
	      courses: "CS61A CS61B EE16A",
	      about: "Gonna be a star one day")
		@tutee.id = 1
		@tutee.save!
	end
	describe "GET users#index" do
		render_views
		it "should render users#index" do
			get :index
			expect(response).to have_http_status(:success)
			expect(response.body).to include "Test User"
		end
	end

	describe "GET users#show" do
		render_views
		it "should show a detailed profile of the user" do
			#params = { id: 1 }
			get :show, params: { id: 1}
			expect(response).to have_http_status(:success)
			expect(response.body).to include "Film"
		end
	end
end
