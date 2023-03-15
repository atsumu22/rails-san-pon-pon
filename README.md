# 📚 Project Name

SAMPOMPOM is a stamp rally generator to help support local shopping streets (shotengai = 商店街). 
A stamp rally is one of the ways to attract people to the shopping streets. However, organizing a stamp rally event is time consuming for most people. This app works to reduce the amount of time needed to prepare stamp rally events. 

 
All the user needs to do is input the information of the rally they want to host. A QR code is generated with a printing option for participating stores to display.  
 
SAMPOMPOM also works for those who want to experience local life in Japan. 
Participants for the stamp rally can enjoy visiting the local shotengai - collecting the rally stamps via the in-store QR code. Once all the stamps are collected, they can redeem a reward which makes the participants’ local trip a little more sweeter. 

![sampompom_screenshots](https://user-images.githubusercontent.com/112766207/225324881-e93c8af5-3bcd-4d83-8997-9d23fe05764a.png)
<br>
App home: https://www.sampompom.team/
   

## Getting Started
### Setup

Install gems
```
bundle install
```
Install JS packages
```
yarn install
```

### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set these variables. For any APIs, see group Slack channel.
```
CLOUDINARY_URL=your_own_cloudinary_url_key
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

## Built With
- [Rails 7](https://guides.rubyonrails.org/) - Backend / Front-end
- [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) & [SCSS](https://sass-lang.com/) — Styling
- [Figma](https://www.figma.com) — Prototyping

## Acknowledgements
This app was inspired by a stamp rally event held in my neighborhood. 

## The Origin of The Idea
The shopping street I used to love visiting has disappeared in the last few years. It was heartbreaking to see these shops turned into new, boring buildings devoid of any character. The old local shopping streets in Japan will likely disappear in the near future.  “I want to help revitalize these shopping streets with Sampompom.”

## Team Members
- [Maria Cosmen](https://github.com/mcosme000)
- [JayzT-DevZJP](https://github.com/JayzT-DevZJP)
- [M'ma K](https://github.com/MKaiKai)
- [Junsuke Watanabe](https://github.com/atsumu22)

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.
