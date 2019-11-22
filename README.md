<p align="center">
  <img height="150px" src="https://i.ibb.co/5WM5rMD/logo-1.png "Up-Stream Logo"">
<br>
</p>
### [Visit Up-Stream](http://18.223.75.248:8080/UpStream/index.do "Up-Stream Homepage")

## The Crimson Hounds

* Samantha Haviland (Developer, DBA)
* Andrew Wong (Developer, Scrum Master)
* Cesar Moreno (Developer, Repo Owner)
* Zak Saylors (Developer, Sultan of Awesome)



## Overview

The main goal of Up-Stream is to facilitate subscriber efficiency for the multitude of media platforms now available. With Up-Stream, our users can add what streaming services they are using, what they are spending monthly on said services, and track what content they’re actually watching . They can also browse other providers and their content to see if they would like to add or replace a subscription. By using our service, individuals will be able to maximize the value they are getting from their streaming subscriptions.



## Description

#### From the index to login

When a user visits Up-Stream they are presented with a screen that shows the most recent content from services that Up-Stream lists.  If the user is not logged in they will only have read privileges to the website.  They may not add services or content to a list, since it does not exist.  They may also not comment or review content.  To get the most out of the website, the user should register by clicking the login navigation link on the top right corner.  From there, the user can register or log in.  Registration is simple asking for a first name, last name, username, and password.  Usernames must be unique or an error message will pop up that says the username already exists.

#### Profile
<p align="center">
<img src="https://i.ibb.co/GsysxMP/Screen-Shot-2019-11-22-at-11-25-24-AM.png "User Profile">
</p>
When registered or logged in, the user will be redirected to the profile page.  If new, the profile will not be populated yet.  The user box displays a profile picture, username, and buttons for update the account.  Update Profile allows the username to update their first name, last name, and password.  Update Picture allows a user to pick from a selection of profile pictures.  Delete will disable the users account.
<p align="center">


#### Expenses and Services Cards
<p align="center">
<img src="https://i.ibb.co/f0F3nT4/Screen-Shot-2019-11-22-at-11-31-51-AM.png "Service Cards">
</p>
When a user adds services, the total spent on the services will be totaled together so the user has an idea of how much they are spending on streaming services.  There are also cards that displays content per the service that the user is watching.  Finally, the user may see all comments they have made and choose to edit or delete them.

#### Services Page

In the navigation bar is a link to services that will show all services.  From there a logged in user will be able to add services to their profile.  

#### Content Pages

There are multiple ways to get to the content page.  On the navigation bar, there is an option to search.  A modal will pop up with an option to enter a keyword.  This will search by title and/or description.  This will render a list with results.  If not results exist it will redirect to the homepage with an error message.  There is also a I'm Feeling Lucky button that will pick a random film or series from the listings and redirect to that content page.  A user may also view content from the first page by clicking on the content card.

The content page displays a carousel with a video and picture on the left.  On the left will be the video title, average rating, services, genres, a description, and (if logged in) and add content button.  If a user already has the content added a delete button will appear.  If a user is logged in and has not reviewed the content before, they may add a comment and a rating.  If they already reviewed it the option will go away, but they may edit or delete their comment from the content page or their profile page.  The rating will be factored into the average rating at the top of the content page.

#### Admin Center
<p align="center">
<img src="https://i.ibb.co/mHvcfhj/Screen-Shot-2019-11-22-at-12-14-05-PM.png "Service Cards">
</p>
An admin account has all the functionality of a normal user.  However, at the bottom of their profile page they will have access to the admin center.  Currently, it has one link to view a list of users.  

<p align="center">
<img src="https://i.ibb.co/Fb7Qk2T/Screen-Shot-2019-11-22-at-12-14-13-PM.png "Service Cards">
</p>
From the list of users, the admin may enable or disable users.  When disabled they will no longer be able to login.  From there, they may be able to be enabled again.  

The admin may also click on the username and view all comments made by that user and choose to delete individual comments.



## The technologies used:

* Agile
* Pair and Swarm Programming
* Java
* Spring Boot
* JPA
* MySql Workbench
* Entity
* HTML
* CSS
* Bootstrap



### Implementation
<p align="center">
<img src="https://i.ibb.co/C1Ct3jy/Screen-Shot-2019-11-21-at-4-19-22-PM.png "Service Cards">
</p>


### Lessons Learned
A very important part of the project was the database design.  As developers, we want to jump straight into programming, but without a good design, our jobs would have been much harder.  We learned that referential integrity was very important so entities could be mapped as intended.  A good database design helped reduce a lot of issues with debugging later in the project.

The team utilized JUnit 5 from the start, so many of the initial mapping and database errors were caught and we were able to proceed quickly to the Spring Boot design.  When working with JSP's and controllers we had errors to include converting a String to an Object.  The ability to read, understand, and debug errors was enhanced with the project.

Another important lesson learned was the Agile process.  We did stand up meetings daily, however it was also important to continuously communicate.  The team had to communicate what each individual was working on in order to prevent merge conflicts or issues with the project.



### Stretch Goals

Many of our stretch goals were reached such as the admin ability to disable users and delete user comments.  Additional admin functionality that we would have liked to implement would be the ability to add content and services.  We needed a little more time in order to debug these features.  We were also able to add search by keyword and I'm feeling lucky.

Additional stretch goals were were not able to get to were:
A Genre search, a discussion board, a list of favorites, and a wishlist.



### Developer Information:

The entire project is hosted in the GitHub repository.  It may be downloaded and open in a IDE such as Eclipse.  The database is called up_stream_db.sql.  From a console, cd to the location were the database has been downloaded `Path: MidtermProject > DB`.  In the command line add the database with the command `mysql -u root -p < up_stream_db.sql`.  Once added the program can be run as a Spring Boot Project in the IDE.
