# Welcome Chat

## Overview

Implement as many of the requirements as you can. Even if not all requirements are met, build something that is
functional and as close to the requirements as possible. It is OK if it is not production ready code.

Feel free to use any resources but all code and functionality should be written by you. Please reply with a link to the
github repository when complete. You can keep it private and add GitHub user `czivko` to have access.

During the followup interview we will code review to discuss your implementation decisions and ways to improve on what
you have completed given more time and resources.

Authentication is implemented with [Devise](https://github.com/heartcombo/devise).

### Requirements

* Ruby on Rails backend
* Asynchronous chat between 2 or more users
* Chat history should be persisted between users
* React or Vue frontend ( SPA )

### Nice to have

* Any relevant tests

____

## Setup and Start the project

### locally

```shell
  ./bin/start.sh
```

### containerized

```shell
  ./bin/docker-start.sh
```

____
Dependencies are Postresql and Redis for pub/sub.  
The versions used are Rails 6.1.4, Ruby 3.0.2, Postgres 11.2 and Redis 5.0.4  

