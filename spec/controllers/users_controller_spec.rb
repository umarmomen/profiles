require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	before do
		@usercount = User.count
		@tutee = User.create!(email: "usertest@gmail.com",
	      password_digest: "password",
	      name: "Test User",
	      major: "Film",
	      philosophy: "Film is the best major, but I teach CS anyway",
	      courses: "CS61A CS61B EE16A",
	      about: "Gonna be a star one day")
	end
	it "create a user and make sure number of users goes up" do
		User.count.should eq (@usercount + 1)
	end

	it "create a user and make sure its in the DB" do
		@usercount = User.count
		expect(User.where(email: "usertest@gmail.com", name: "Test User")).to exist
	end
end