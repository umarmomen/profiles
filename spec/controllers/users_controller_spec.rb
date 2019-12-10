require 'rails_helper'

RSpec.describe UsersController, type: :controller do
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
end





RSpec.describe User, :type => :model do
	subject { described_class.new }

	it "is valid with valid attributes" do
		subject.email = "something@berkeley.edu"
		subject.password = "something"
		subject.name = "something"
		subject.major = "something"
		expect(subject).to be_valid
	end

	it "is not valid without an email" do
		expect(subject).to_not be_valid
	end
end