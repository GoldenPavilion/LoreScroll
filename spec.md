Specs:

- [X] Using Ruby on Rails for the project
--- Set up project using rails new LoreScroll
- [X] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
--- User has many stories, has many worlds. World has many characers. Story has many characters, has many story_genres. Genre has many story_genres.   
- [X] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
--- World belongs to user. Story belongs to user. Character belongs to world, belongs to story. StoryGenre belongs to story, belongs to genre. 
- [X] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
--- World has many stories through characters. Story has many worlds through characters. Story has many genres through story_genres. Genre has many stories through story_genres.  
- [X] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
--- World has many stories and Story has many worlds, through characters. Story has many genres and Genre has many stories, through story_genres. 
- [X] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
--- The Character model, whose migration is the join table for World and Story, has a number of submittable attributes, including name, age, role, gender, species, job, motivation, etc. 
- [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) --- User validates if username, author_name and email are present. It also validates if username and email are unique. World validates that name is present and is unique for that user. For example, two different users could have a World called "Middle Earth", but the same user could not have two worlds called "Middle Earth". Story validates that a title is present and is unique for that user. Character validates that a name, world_id and story_id are present on creation and that the name is unique to that story. 
- [X] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) --- World includes scope for most_recent. Story includes scope for most_recent. Character includes scopes for order_by_name, order_by_role and main_characters. Can test main_characters scope method by navigating to /characters/main_characters.
- [X] Include signup (how e.g. Devise) --- User can sign up for new account by navigating to /users/new.
- [X] Include login (how e.g. Devise) --- User can login to their existing account by navigating to /signin. 
- [X] Include logout (how e.g. Devise) --- User can log out by clicking on the "Log Out" button in the navigation bar - this is routed to /signout, which destroys the current session.
- [X] Include third party signup/login (how e.g. Devise/OmniAuth) --- User can signup or login using Google Omniauth, which is linked on the welcome page. Uses the SessionsController#google_auth method, along with the User.google_create model method to log user in with Google Credentials. 
- [X] Include nested resource show or index (URL e.g. users/2/recipes) --- Characters are nested within Stories in both show and index routes. Ex: /stories/:id/characters will take the user to a list of all the characters associated with a specific story - while /stories/:id/characters/:id will display information about an individual character.  
- [X] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) - User can add a character to a story by navigating to /stories/:id/characters/new. A hidden field in the new characters form automatically associates the story_id of the parent Story. 
- [X] Include form display of validation errors (form URL e.g. /recipes/new) - Created an errors partial in shared/errors.html.erb. This partial is rendered using locals on the worlds new, users new, stories new and characters new forms - when validations do not pass. 

Confirm:

- [ ] The application is pretty DRY
- [X] Limited logic in controllers --- Created current_user, logged_in? and require_login methods in ApplicationController. current_user checks to verify that the User matches the User of the session. logged_in? ensures that current_user is true, verifying that the User is logged in. require_login redirect the user back to the signin path if they aren't logged in. Before Actions in StoriesController, CharactersController and WorldsController trigger the require_login method to make sure users don't have access to data unless they are logged in. Also built out individual created_by_user private methods in each controller, that verify the id of the user. This is also triggered by a Before Action, preventing users from being able to edit the data of other users.    
- [ ] Views use helper methods if appropriate
- [X] Views use partials if appropriate --- Each major views folder (worlds, stories, characters) contains a _form partial that is used to render the necessary new and edit forms without repetition. Errors are rendered using the errors partial in the shared folder.  