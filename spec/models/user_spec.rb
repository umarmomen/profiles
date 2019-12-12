require 'rails_helper'

RSpec.describe User, type: :model do
	#pending "add some examples to (or delete) #{__FILE__}"
	before do
		@usercount = User.count
		@tutee = User.create!(email: "usertest@berkeley.edu",
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
		expect(User.where(email: "usertest@berkeley.edu", name: "Test User")).to exist
	end

	it "create a second user and confirm both are present" do
		@tutee2 = User.create!(email: "usertest2@berkeley.edu",
	      password_digest: "password",
	      name: "Test User2",
	      major: "Film",
	      philosophy: "Film is not the best major, but I teach CS anyway",
	      courses: "CS61A CS61B EE16A",
	      about: "Gonna be a star one day")
		User.count.should eq (@usercount + 2)
		expect(User.where(email: "usertest@berkeley.edu", name: "Test User")).to exist
		expect(User.where(email: "usertest2@berkeley.edu", name: "Test User2")).to exist
	end

	it "create a second user with invalid email and confirm only 1 present" do
		expect {
			@tutee2 = User.create!(email: "usertest2@gmail",
		      password_digest: "password",
		      name: "Test User2",
		      major: "Film",
		      philosophy: "Film is not the best major, but I teach CS anyway",
		      courses: "CS61A CS61B EE16A",
		      about: "Gonna be a star one day")
		}.to raise_error(ActiveRecord::RecordInvalid)
		User.count.should eq (@usercount + 1)
	end

	it "is valid with valid attributes" do
		@tutee3 = User.new
		@tutee3.email = "something@berkeley.edu"
		@tutee3.password = "something"
		@tutee3.name = "something"
		@tutee3.major = "something"
		expect(@tutee3).to be_valid
	end

	it "is not valid without an email" do
		expect(User.new).to_not be_valid
	end

end
