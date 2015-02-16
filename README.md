Blocitoff is a Ruby on Rails application which is hosted [here](https://hidden-brushlands-2390.herokuapp.com). It allows registered users to create multiple lists, each of which may contain multiple “todo” items. Each list has a “cutoff,” a number of days after which any undone item on that list is automatically deleted. The user chooses the cutoff when they create the list.

I used [Devise](https://github.com/plataformatec/devise) to handle user authentication. Only registered and signed-in users can see any of the active options. Please take a look at application.example.yml for guidance on setting up your application.yml file.

A User may have many lists and a list may have many todos, so User has a 'has_many :through' relationship with Todos through the List model.

The automatic deletion of undone todo items is performed in the Lists Controller, in the show action, as todos are listed in the List#show view. Todos are also deleted from the database when the user clicks on “Completed” for the given todo.

I used javascript and CSS animations to create fade in/fade out effects for page transitions.

