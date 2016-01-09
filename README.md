# wdiForum
A tool designed for WDI students to (1) ask questions, (2) ask and give feedbacks on projects/project ideas, and (3) communicate with each other through  private messages and forum-chatroom.

Users can sign up for a free account as either a student or an instructor to create and reply to posts.

### Technologies
Ruby on Rails | Bootstrap | jQuery | HTML5 | CSS | PostgreSQL | Nerian

### Deploy on Heroku
[wdiForum | Web Development Immersive Forum](http://wdiforum.herokuapp.com/)

# ERD | Entity-Relationship Diagram
![alt tag](https://raw.githubusercontent.com/llovee91/wdiForum/master/app/assets/images/Model.png)

# Wireframe
![alt tag](https://raw.githubusercontent.com/llovee91/wdiForum/master/app/assets/images/Layout.png)

### Homepage
Guests will have the option to login/signup or browse the subfroums
![alt tag](https://raw.githubusercontent.com/llovee91/wdiForum/master/app/assets/images/homepageGuest.png)

Users will have the option to check the forum-chatroom, account setting, user-profile inbox, browse the subforums and to logout.
![alt tag](https://raw.githubusercontent.com/llovee91/wdiForum/master/app/assets/images/homepageUser.png)

### Subforum
Each of the user type (guest/student/instructor) will have different authorities in the subforums:
![alt tag](https://raw.githubusercontent.com/llovee91/wdiForum/master/app/assets/images/UserAuthority.png)

### User Profile
Each registered user will have a user profile which shows the articles and surveys that he/she has created. Users will also have the option to message another user from this page from clicking the "message" button.
![alt tag](https://raw.githubusercontent.com/llovee91/wdiForum/master/app/assets/images/userProfile.png)

### Features
#### Forum Chatroom
![alt tag](https://raw.githubusercontent.com/llovee91/wdiForum/master/app/assets/images/ForumChatroom.png)

#### Message Center/Inbox
![alt tag](https://raw.githubusercontent.com/llovee91/wdiForum/master/app/assets/images/Inbox.png)

#### Like/Unlike
![alt tag](https://raw.githubusercontent.com/llovee91/wdiForum/master/app/assets/images/like.png)

# User Stories
As a user, I want to have easy access to my posts or posts of a specific user.

As a user, I want to have the option to style my posts by inserting images, lists or letters of different sizes.

As a user, I want to like or unlike a post.

As a user, I want to post surveys and keep the replies private so no one other than myself will have access to it.

As a user, I want to be able to have private conversation with another user.

As a user, I want to be able to reply to posts.

As a user, I want to be able to edit or delete posts/replies I've created on the forum.

As a user, I want to be able to edit my profile information.

### Future Implementation
1) Provide the option for users to sort the subforum posts by (1) date of most recent reply or (2) date created

2) Implement a tool for users to upload profile pictures

3) Convert forum chatroom into real-time streaming

4) Implement points system for users who create posts or reply to posts

5) Implement rank system  
