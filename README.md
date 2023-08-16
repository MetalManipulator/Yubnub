# Yubnub
An iOS application that displays the information for people in the Star Wars universe provided by the Star Wars API (https://swapi.dev)

## Features
Yubnub is a simple List/Detail view iOS application that shows a list of the characters in the Star Wars movies. Tapping on a Person's row navigates to the Detail View which contains more information.

## Future Features
While this application was a quick proof of concept, there are future features that would greatly expand the user experience. They may be implementedin the future.
- The ability to chose the other model data types on the list screen
- The ability to navigate down through multiple details screens.
- The SWAPI does not contain images, it would be great to cross-reference with another location to get a basic image for the entry being viewed.
- Better/Additional unit tests

## Usage
- Built using Xcode 14.3.1 and minimum supported iOS of 16.0.
- This repo ustilizes SwiftLint for code cleanliness. Add SwiftLint to your machine via the instructions at [SwiftLint's GitHub](https://github.com/realm/SwiftLint). If you do not want to add SwiftLint, you may need to remove the Build Phase "SwiftLint" under the target setting of the project.
- The SWAPI does not require an API key. You should be able to clone this repo and run the application without having to make any changes besides licensing/provisioning if needed.
