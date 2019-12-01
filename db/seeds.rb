# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

seed_accounts = User.create(
  [
    {email: "user1@gmail.com",
      password_digest: "password",
      created_at: "12/02/03 14:00",
      updated_at: "12/02/03 14:00",
      name: "George Lucas",
      major: "Film",
      year: "3",
      philosophy: "Film is the best major, but I teach CS anyway",
      courses: "CS61A CS61B EE16A",
      about: "Gonna be a star one day"
    },
    {email: "user2@gmail.com",
      password_digest: "password",
      created_at: "12/02/03 14:00",
      updated_at: "12/02/03 14:00",
      name: "Freddie Von Heim",
      major: "Sports Science",
      year: "3",
      philosophy: "Sports sports sports",
      courses: "CS61A CS61C EE16A DATA8",
      about: "Sports ischt fun"
    },
    {email: "user3@gmail.com",
      password_digest: "password",
      created_at: "12/02/03 14:00",
      updated_at: "12/02/03 14:00",
      name: "Yang Gan",
      major: "Bioengineering",
      year: "2",
      philosophy: "From the land, to the shore, hear our proud and mighty roar. With our hearts with our soul all in mind it must be known, signals is our home",
      courses: "CS70 EE16A EE16B DATA8",
      about: "Signals specialist"
    },
    {email: "user4@gmail.com",
      password_digest: "password",
      created_at: "12/02/03 14:00",
      updated_at: "12/02/03 14:00",
      name: "Raphael Illumade",
      major: "Philosophy",
      year: "4",
      philosophy: "Yes",
      courses: "DATA8",
      about: "Trolley enthusiast"
    },
    {email: "user5@gmail.com",
      password_digest: "password",
      created_at: "12/02/03 14:00",
      updated_at: "12/02/03 14:00",
      name: "Rachel Belch",
      major: "Computer Science",
      year: "4",
      philosophy: "I can teach everything",
      courses: "CS61A CS61B CS61C EE16A EE16B CS70 DATA8",
      about: "Teaching enthusiast"
    },
    {email: "user6@gmail.com",
      password_digest: "password",
      created_at: "12/02/03 14:00",
      updated_at: "12/02/03 14:00",
      name: "Zeus",
      major: "Electrical Engineering and Computer Science",
      year: "7",
      philosophy: "Do ye homewurk else be smite'd",
      courses: "EE16A EE16B",
      about: "God of Thunder"
    }
  ]
)
