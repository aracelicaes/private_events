<!-- PROJECT LOGO -->
# Private Events: Evento Privato
This Project is an app built using Ruby on Rails meant to mimick the functionality of Eventbrite. This rails app was built to implement the creation of Private Events a Web app where you can create an event, "buy" your attendance for an event while being signed in by simply using your username.

<!-- TABLE OF CONTENTS -->
## Table of Contents
- [Private Events: EventoPrivato](#private-events-evento-privato)
  - [Table of Contents](#table-of-contents)
- [About The Project](#about-the-project)
- [Getting started](#getting-started)
  - [Installation](#installation)
  - [Features:](#features)
  - [Ruby Gems used in this project](#ruby-gems-used-in-this-project)
- [Authors](#authors)
- [Acknowledgements](#acknowledgements)
  - [Show your support](#show-your-support)
<!-- ABOUT THE PROJECT -->
# About The Project
This Project is an app built using Ruby on Rails meant to mimick the functionality of Eventbrite. This rails app was built to implement the creation of Private Events a Web app where you can create an event, "buy" your attendance for an event while being signed in by simply using your username.
This project demonstrates a User Role system giving the web application and native application feel all within the browser. We used Rails generators to help scaffold views. The app features the CRUD principle where we create & read Events.

![screenshot](events.png)

<!-- GETTING STARTED -->
# Getting started
## Installation
* Clone the repo following [this link](https://github.com/aracelicaes/private_events)
* Install all dependencies running from terminal using the command <pre><code>bundle install
</code></pre>
* Run from terminal <pre><code>bin/rails server
</code></pre>

## Features:
* Ruby 2.7.0
* Rubocop
* Ruby Gems
* Postgresql
* Rspec
* Capybara

## Testing
* Run from your terminal to test the project<pre><code> rspec </code></pre>
<pre><code> 
Attendance
  #Associations
    Attendance has a foreign_key from user_id
    Attendance has foreign_key from event_id
    Attendance belongs to User Class
    Attendance belongs to Event Class

Event
  #Validations
    Event is valid with all attributes
    Event is invalid due to empty attributes
    Event is invalid due to empty title
    Event is invalid due to empty date
    Event is invalid due to empty creator
  #Associations
    Event has a foreign_key from user id
    Event has many attendances
    Event has many attendees through attendances w/user source
    Event does not belong to attendances
    Event does not belong to attendee

User
  #Validations
    Valid User with all atributes
    Invalid user due to nil name
    Invalid user due to nil username
    Invalid user due to short username
    Invalid user due to long username
  #Associations
    user has many events
    user has many attendances
    user has many attended_events
    user does not belongs to events
    user does not belongs to attendances
    User does not belong to attended_events

Events
  #Events management
    Doesn't create event due to missing sign in.

Sessions
  Logs me in
  Logs me out
  Fails Login Due to Wrong Username
  Not Logged in so Finds Login Button

Users
  #Authentication
    enables me to create new user
    disable me to create new user
</code></pre>

## Ruby Gems used in this project

* [Bootstrap](https://getbootstrap.com/) - SCSS Framework
* [Font-Awesome](https://fontawesome.com/) - For SASS icons

<!-- CONTACT -->
# Authors
👤 **Ara Camarillo**

- Github: [aracelicaes](https://github.com/aracelicaes)
- Twitter: [@Ara_CE_93](https://twitter.com/Ara_CE_93)
- Linkedin: [Ara Camarillo](www.linkedin.com/in/ara-camarillo)

👤 **Jessica Farias**

- Github: [jessicafarias](https://github.com/jessicafarias)
- Twitter: [@FariasRosado](https://twitter.com/FariasRosado)
- Linkedin: [jessica-michelle-farias-rosado](https://www.linkedin.com/in/jessica-michelle-farias-rosado/)

📄 **Project Link: [Click Here](https://github.com/aracelicaes/private_events)**
<!-- ACKNOWLEDGEMENTS -->
# Acknowledgements
- [Microverse](https://microverse.org)
- [Best-README-Template](https://github.com/othneildrew/Best-README-Template)
- [Rails Guides](https://guides.rubyonrails.org/)
- [The Odin Project](https://www.theodinproject.com/courses/ruby-on-rails/lessons/associations?ref=lnav)

## Show your support

Give a ⭐️ if you like this project!
