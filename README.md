#dragAndDrop

**MySQL setup steps**  

1. Login to your MySQL server  
`mysql -u root -p`  

2. Create a database called villaitalia_db  
`CREATE DATABASE dAD_development;`  

3. Create a new MySQL user (note: this user is only for dev/test purposes)  
`CREATE USER 'dAD_user'@'localhost' IDENTIFIED BY 'myPassword';`  

4. Tell MySQL to grant privileges to the new user above so that it can perform operations on the villaitalia_db database  
`GRANT ALL PRIVILEGES ON dAD_development.* TO 'dAD_user'@'localhost';`  

5. Confirm the privileges above  
`FLUSH PRIVILEGES;`  

6. Let's check if all is good, exit from MySQL  
`EXIT;`  

**RAILS setup steps**    

1. Enter the base directory of the Rails app  
`cd dragAndDrop`  

2. Install required gems, as per Gemfile  
`sudo bundle install`  

3. Run database migrations, in order to create/modify the required tables  
`rake db:migrate`  

5. Create an Admin an a new User for the site, open the rails console  
`rails c`  

	- *Create the admin*  
	`@a = Admin.new :id => 1, :email => "admin@user.com", :password => "superpowers"`  

	- Save the new admin  
	`@a.save`  
	
	- *Create the User*  
	`@u = User.new :id => 1, :email => "user@user.com", :password => "nopower", :password_confirmation => "nopower"`  

	- Confirm The new User  
	`@u.confirm`

	- Save the new admin  
	`@u.save`  

**Note** if you find some issues with the database or you want to purge it  
`rake db:drop db:create db:migrate db:seed`  
The code above will delete every data inside the db (so you have to recreate the admin)    

Now you created in the database villaitalia_db in the table admins.  
The admin user with email id=1, email="admin@user.com", password="superpowers".  
You will need this user to change the wines!    

**Running the app**    

1. On your local machine, start the Rails server  
`rails s`  

2. Launch your favorite browser, and verify that the app actually works by typing the following on your address bar  
`http://localhost:3000`  

3. (Optional) If you do not see any images, or the webpage layout looks messy, then run the following commands  
`sudo bundle exec rake assets:clean RAILS_ENV=development`  
`sudo bundle exec rake assets:clobber RAILS_ENV=development`  
`sudo bundle exec rake assets:precompile RAILS_ENV=development`  


