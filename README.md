# PetSitr

Welcome to the PetSitr App! Your one and only stop to find a Pet Sitter near you.

Technologies used:

* Ruby on Rails
* Google Maps API
* Whatsapp API
* PostgreSQL
* Bootstrap 4
* Devise, FFaker gem

## Approach

1. Identify user problems when it comes to pet sitting
  * Narrow down more specific problems
2. Draft ERD
3. Design wireframes for the MVP
4. Discuss work distribution
5. Communicate frequently

## Installation

Fork the repo, then run:

`git clone https://github.com/YourUserName/petsitr.git`

Next install all dependencies and migrate the database:

`bundle install`

`rails db:create`

`rails db:migrate`

`rails db:seed`

To run the app:

`rails s`

Then access in Browser:

`localhost:3000`

## ERD and Wireframes

1. [ERD(updated)](https://i.imgur.com/CeqwoP6.png)
2. [Wireframes](https://i.imgur.com/fKdinO2.jpg)

## Unsolved

1. Responsiveness on bookings page to be perfected
3. Validation and failed validation rendering to be completed
4. Implementing a review/rating system for completed pet sitting to be done

## Problems

1. Dates, their logic and restricting user input for them
2. Validation
