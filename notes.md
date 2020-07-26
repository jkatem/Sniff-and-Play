Requirement:
    1. Models include reasonable validations for the simple attributes
    2. Include class level ActiveRecord scope method
        - scope method must use ActiveRecord Query methods (.where, .order) 
    3. Omniauth
    4. Forms should display validation errors. 
        - fields must be enclosed within a fields_with_errors class.
        - Error messages must be present within the view. 
____________________________

user signs up or log ins
    - sign up 
        - need new.html.erb for user to fill name, email, and password
        - form will then direct user to users show page 
    - login 
        - how do we get the login page? 
            - need a new action
            - need a new views page with log in info
            - where will the form submit to?
        - after user logins, they will be taken to a page that shows all their dogs? 


    ** TODO **
        1. Set validations for models




DOG => BELONGS TO USER, therefore has the user_id
    - what do I want to happen?
    - User creates profile for their dog

DOG'S SHOW PAGE:
    - give user ability to edit, update, delete
    - /users/:id/dogs
    - user sees this page after loggin in and after creating dog profile 
    - provide link to dog's photo page? 

use .build or .find in my create action?
    - .build:
        

PHOTOS 
    - new action
    - show action
    - create action
        * saves new Photo object and redirects to the newly-created photo's show page
    - edit
    - delete
    - belongs to dog
        - example: post belongs to author
        Post#author (similar to Author.find(author_id))

        Post#author=(author) (similar to post.author_id = author.id)

        Post#build_author (similar to post.author = Author.new)

        Post#create_author (similar to post.author = Author.new; post.author.save; post.author)

        Post#create_author! (similar to post.author = Author.new; post.author.save!; post.author)

        Post#reload_author
    
    - star capability:
        - define like method 
        - user clicks on the start, and the number of stars increases 
