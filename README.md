# CS370B Profiles
As part of the CS169 project, this website was created such that anyone can view tutor profiles for students that are currently or were previously enrolled in CS370, instructed by Christopher Hunn.

# System Requirements:
  * Ruby 2.6.3
  * Rails 5.2.3
  
  For assistance with installation, check out [this website](https://gorails.com/setup/windows/10).
  
# Setting Up
 After cloning this repository, run the following command in terminal:
 ```
 $ bundle install --without production
 ```
 Once this has finished, run the following line to set up the database:
 ```
 rails db:reset
 rails db:migrate
 ```
 Finally, the server can be started anytime from this directory using the following command:
 ```
 rails server
 ```
 When creating an account, there is a secret key that must be entered.  The secret key is currently set to `CS` and can be found in `app/models/user.rb` under the `self.get_secret_key` function, and can be altered via this function.
  
# Testing
  
# Deployment
First, ensure that you have git installed by running 
```
$ git --version
```
If not, follow the guide on [this website](https://www.linode.com/docs/development/version-control/how-to-install-git-on-linux-mac-and-windows/)

Next, ensure that you have a heroku account, which can be created [here](https://signup.heroku.com/).  Once you have an account, follow instructions [here](https://devcenter.heroku.com/articles/git) to deploy the application to heroku via git.
 
  
  
