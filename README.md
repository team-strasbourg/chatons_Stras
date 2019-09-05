# Little Kitten

Little Kitten is an online shop that sells the cutest cat pictures you could find on the internet.<br /><br />
As a user, you can :
- Browse through cat pictures.
- Go to each picture's page.
- Sign up and log in to the website.
- Add cat pictures to your cart.
- Pay with Stripe.
- Receive your cat pictures by email.

## Link to production Website

[https://chatons-stras.herokuapp.com/](https://chatons-stras.herokuapp.com/)

## Warning

Our mailing system works with Sendgrid.
As Sengrid is limited on sending mails, please do:
- one registration per corrector.
- one Stripe paiement per corrector.

Thank you!

## Motivation

This website was built in week 9 out of a 12 weeks dev bootcamp called "The Hacking Project".
It intends to be a first trial at a concrete website before our final project.

## Installation steps

- Download project or clone it with ```git clone https://github.com/team-strasbourg/chatons_Stras```
- Open your terminal
- Create Gemfile.lock with ```bundle install```
- If a database already exists ```rails db:drop```
- Create database ```rails db:create```
- Migrate database tables ```rails db:migrate```
- Populate database ```rails db:seed```

## Admin dashboard

An admin is created with the seed. If you wish to log in with the admin account, use the credentials you can find in db/seeds.rb

## Tech/framework used

<b>Built with</b>
- [Ruby On Rails](https://rubyonrails.org/) v2.5.1

## Credits

The Hacking Project Session 9 Strasbourg :
- [BoomyBox](https://github.com/Boomybox)
- [Carsano](https://github.com/Carsano)
- [Giantcarlo](https://github.com/Giantcarlo)
- [iroshiva](https://github.com/iroshiva)
- [Nadrojz](https://github.com/Nadrojz)
