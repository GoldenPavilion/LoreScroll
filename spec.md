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
- [X] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) --- World includes scope for most_recent. Story includes scope for most_recent. Character includes scopes for order_by_name, order_by_role and main_characters. 
- [X] Include signup (how e.g. Devise) --- User can sign up for new account by navigating to /users/new.
- [X] Include login (how e.g. Devise) --- User can login to their existing account by navigating to /signin. 
- [X] Include logout (how e.g. Devise) --- User can log out by clicking on the "Log Out" button in the navigation bar - this is routed to /signout, which destroys the current session.
- [X] Include third party signup/login (how e.g. Devise/OmniAuth) --- User can signup or login using Google Omniauth, which is linked on the welcome page. 
- [ ] Include nested resource show or index (URL e.g. users/2/recipes)
- [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:

- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate