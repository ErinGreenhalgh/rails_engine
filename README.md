#Rails Engine

##Development Team
* [Erin Greenhalgh](https://github.com/eringreenhalgh)
* [Karina Gonzalez](https://github.com/karinamzalez)

This project was built as part of the curriculum at the Turing School of Software and Design. For full project specifications please see the [original assignment](https://github.com/turingschool/lesson_plans/blob/master/ruby_03-professional_rails_applications/rails_engine.md).

###Deployment & Testing

1.Clone the repo and bundle

```bash
git clone https://github.com/ErinGreenhalgh/rails_engine
cd rails_engine
bundle
```

2.Create and migrate the database

`rake db:create db:migrate`

3.Import the csv files data

`rake all_data:import`

4.Run the test suite

`rspec`

5.Run the server

`rails s`
