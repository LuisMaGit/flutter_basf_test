# flutter_basf_test

## Architecture
The project follows the MVVM architecture.
The Views sends events to the View Model, the View Model consumes services where all the logic happens, get a response and refreshes the screen state.
All the logic is separated in services and isolated, so it can be unit tested.
The same with the UI is fully independent from the logic.

## TODO
I did not notice the time and some feature/requirements were left to be done, here I will explain what would be my next steps:
* Details screen: The list screen already navigates to the Details View (trivial_view.dart), I would have done this view following the same approach that was followed for the list view.
* Favorites screen: Also I would have fallowed the same approach. And I would have created a new service for storing the favorite data (same as we get the date with the network_service), I would have created a storage_service, making use of some persistent library like objectbox or sqflite.
* Tests: All the services and view models can be unit tested (no UI in it), all have a constructor where the dependencies are injected, so we could use a mock library like mockito to mock the dependencies and write the tests.






