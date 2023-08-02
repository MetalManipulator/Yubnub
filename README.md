# Yubnub
An iOS application that displays the information for people in the Star Wars universe provided by the Star W ars API (https://swapi.dev)

## Features
Yubnub is a simple List/Detail view iOS application that shows a list of the characters in the Star Wars movies. Tapping on a Person's row navigates to the Detail View which contains more information.

## Future Features
While this application was a quick proof of concept, there are future features that would greatly expand the user experience. They may be implementedin the future.
- Additional data types for planets, ships, etc. And the ability to chose these on the main screen
- Ability to recursively fetch the other types to make cross-linking in details screen possible (E.g A Person's details lists the planets they've been on, these need to be recursively feteched to show their name on the Person detail.)
- Ability to navigate down through multiple details screens.
- The SWAPI does not contain images, it would be great to cross-reference with another location to get a basic image for the entry being viewed.
- Better/Additional unit tests

## Usage
- The SWAPI does not require an API key. You should be able to clone this repo and run the application without having to make any changes besides licensing/provisioning if needed.
