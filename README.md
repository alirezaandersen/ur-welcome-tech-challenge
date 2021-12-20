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

- Ruby on Rails backend
- Asynchronous chat between 2 or more users
- Chat history should be persisted between users
- React or Vue frontend ( SPA )

### Nice to have

- Any relevant tests

---

## Setup and Start the project

### locally

```shell
./bin/start.sh
```

### containerized

```shell
./bin/docker-start.sh
```

---

Dependencies are Postresql and Redis for pub/sub.  
The versions used are Rails 6.1.4, Ruby 3.0.2, Postgres 11.2 and Redis 5.0.4

### Comments

#### Thought Process

This is a continuation of the technical code pairing challenge to get all messages from a Conversation Room to show up. I didn't want to spend more than an hour on this. My approach goal was to be as simplistic as possible. The 3 cases I thought of where as follow

1. Show all messages belonging to a Conversation Room
2. Raise an error if a Conversation Room does not exist
3. Raise an error if no messages from a Conversation exist

- I followed standard Api Best practices, in the [api/v1/messages_controller](https://github.com/alirezaandersen/ur-welcome-tech-challenge/blob/master/app/controllers/api/v1/messages_controller.rb) you will only see a successful response. There are no conditions or pre-checks to validate any params or other items as the controllers job is to only take in items (User Authentication was not considered during anytime of this implementation)

- Once the controller gets the proper information `conversation_room_id` from there the [MessageGroupGenerator](https://github.com/alirezaandersen/ur-welcome-tech-challenge/blob/master/app/controllers/concerns/message_group_generator.rb)
  implements the (logic). If I did have the proper time I would have used **(ActiveModel::Validator)** to implement the 2 check `conversation_exist? and related_messages`

- At this point if the either one of those methods are not met a error gets raised and is handled at the [application_controller](https://github.com/alirezaandersen/ur-welcome-tech-challenge/blob/master/app/controllers/application_controller.rb) If I had more time I would have been more detailed with the type of errors that are being raised and would have created a `api error base exception class` where all errors would be handled a single source allowing it to be easily maintained and followed.

##### Specs

- [requests/api/v1/messages_spec](https://github.com/alirezaandersen/ur-welcome-tech-challenge/blob/master/spec/requests/api/v1/messages_spec.rb)

#### Would be nice to have

- Unit Specs
- Separation of checks in MessageGroupGenerator
- More detailed error handling
- Api Error Base Exception Class
