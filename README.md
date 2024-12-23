# CarsApp
Application to manage cars and maintenance services, developed in Ruby on Rails.

## Requirements
It's required to have the following installed:
- Ruby >= `3.3.6`
- Rails >= `8.0.1`
- Node >= `18.0.0`
- Yarn >= `1.22.22`

## Installation
You must download this repository and run the following commands:
- First you must install the project gems by running:
```console
~$ bundle install
```
- You must load the necessary tables to your database:
```console
~$ rails db:migrate
```
- To load random data to database tables you need to run:
```console
~$ rails db:seed
```

## User creation
In order to see all the functionality of the application, an admin user is required. To create it, follow these steps:
- Run your app with `rails s`
- Visit [Link text Here](https://localhost:3000).
- Select create user in the Navbar.
- Open the console and run this:
```console
~$ rails c
cars-app(dev)> u = User.find_by_name("UserName")
  User Load (0.6ms)  SELECT "users".* FROM "users" WHERE "users"."name" = 'Octavio Lugo' LIMIT 1 /*application='CarsApp'*/
=> 
#<User:0x000000011fff92e8
...
cars-app(dev)> u.admin = true
=> true
cars-app(dev)> u.save
  TRANSACTION (0.1ms)  BEGIN immediate TRANSACTION /*application='CarsApp'*/
  User Exists? (0.6ms)  SELECT 1 AS one FROM "users" WHERE LOWER("users"."email") = LOWER('octaviolugocamacho@gmail.com') AND "users"."id" != 21 LIMIT 1 /*application='CarsApp'*/
  User Update (0.1ms)  UPDATE "users" SET "updated_at" = '2024-12-23 04:28:56.147531', "admin" = 1 WHERE "users"."id" = 21 /*application='CarsApp'*/
  TRANSACTION (0.6ms)  COMMIT TRANSACTION /*application='CarsApp'*/
=> true
cars-app(dev)> exit
```
- With these commands you can turn your user into an administrator

## Testing
Use the `rspec spec/controllers/cars_controller_spec.rb` command to run the tests that were added with rspec.
