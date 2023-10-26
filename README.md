# About

Web application utilizing the OpenWeatherMap API to provide weather information when available for the due dates of tasks to the end user.

## Implementation details
The task was broken down into smaller problems 

* Setting up application i.e including devise and other userful gems etc
* Model Creation with validation, relevant specs, factories etc
* Setting Up JWT for the User
* Using the JWT for Tasks CRUD
* Integration of OpenWeather API
* Displaying the Tasks data along with the weather forecast
* Performance Optimization (Executing all HTTP requests concurrently in threads by using Batchloader and Parallel Gem)


## How it works:

### User is requested is signup
<img width="1123" alt="Screenshot 2023-10-26 at 03 52 45" src="https://github.com/nitanshu1808/task_manager_weather_app/assets/15921580/73b24400-af21-4a62-86f4-e93ec9ad639b">

### On Successfully Logging into the system, user copies his JWT token and creates associated tasks
<img width="1711" alt="Screenshot 2023-10-26 at 04 13 34" src="https://github.com/nitanshu1808/task_manager_weather_app/assets/15921580/69009983-a578-4482-9e0c-680b239fd193">

### Once all the tasks are created, it is displayed at the root page
<img width="1720" alt="Screenshot 2023-10-26 at 03 51 57" src="https://github.com/nitanshu1808/task_manager_weather_app/assets/15921580/0b124f7c-abd0-4176-91f6-95b0808344ca">

### On logging out, user is redirected to the sign in page
<img width="693" alt="Screenshot 2023-10-26 at 03 52 35" src="https://github.com/nitanshu1808/task_manager_weather_app/assets/15921580/53bfdb4d-66c1-4237-8435-3207f0ffc1aa">

## Database Architecture
Consider the ER diagram for the databse
![database](https://github.com/nitanshu1808/task_manager_weather_app/assets/15921580/a8e6d029-424a-40a0-83a1-9454a8e94f46)

## RSpec Specs
### Consider the Rspec Tests implemented

#### [Model Specs](https://github.com/nitanshu1808/task_manager_weather_app/tree/main/spec/models)
<img width="849" alt="Screenshot 2023-10-26 at 04 27 40" src="https://github.com/nitanshu1808/task_manager_weather_app/assets/15921580/5ff5c435-b801-4339-855e-207769641ef8">

#### [Adaptor Specs](https://github.com/nitanshu1808/task_manager_weather_app/blob/main/spec/adaptors/task_adaptor_spec.rb)
<img width="1725" alt="Screenshot 2023-10-26 at 04 29 59" src="https://github.com/nitanshu1808/task_manager_weather_app/assets/15921580/43247bac-e574-4a4d-9d2c-5858279c4a07">

#### [Request Specs](https://github.com/nitanshu1808/task_manager_weather_app/tree/main/spec/requests)
<img width="794" alt="Screenshot 2023-10-26 at 04 31 10" src="https://github.com/nitanshu1808/task_manager_weather_app/assets/15921580/663d6c79-6c67-4809-9fec-86e5d46aa233">

### Todos
* UI improvements
* Adding specs for user registration/sessions
* Pagination for Task Listing
  

## Declaration
I acknowledge that the work, I have submitted for assessment is all my own work.
