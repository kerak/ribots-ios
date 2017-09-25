# Ribots iOS

An awesome App to display all the info about Ribots!

## First, some technical stuff

The App uses the following libraries:
* **[Alamofire](https://github.com/Alamofire/Alamofire)** - One of the best networking libraries, always a must in any project that has to communicate with an API
* **[BouncyLayout](https://github.com/roberthein/BouncyLayout)** - Provides bouncing animations to the cells of a collection view, I used it to improve the look of the main screen
* **[Kingfisher](https://github.com/onevcat/Kingfisher)** - A great library for image downloading and caching
* **[PullToDismiss](https://github.com/sgr-ksmt/PullToDismiss)** - Relatively unknown (even though is part of [awesome-ios](https://github.com/vsouza/awesome-ios)) and a bit outdated, but still a great help when you need a quick implementation of pull to dismiss functionality
* **[Hero](https://github.com/lkzhao/Hero)** - Hands down the best library when it comes to iOS animations

## Some thougts about the project

The idea behind the project was to create a quick and nice looking demo that displays a list of all the Ribots, and their personal details when selecting any of them

I took a minimalistic approach to the UI in order to keep the project simple (we all know how projects complexity can easily grow exponentially!)

Regarding the code I tried to use well known and solid libraries, same as I would do in a real project. I also tried to keep it as simple as possible, but structuring the code the same way that I would do in real life. 

The project is divided into four main parts:
* **API** - This is where all the fetching, parsing and deserializing happens, it includes the Models, and the API file (in a bigger project this file would be divided into resources, routes and possibly a networking helper to improve the readability and maintanability of the code.
* **Extensions** - Here I keep all the "util" functions, as a rule of thumb these files should be interchangeable between projects
* **Components** - Includes all the custom Views that are used in the project. In this case there is only the main screen cell
* **ViewControllers** - This is where all the ViewControllers are, as projects grow in size I usually divide them in functional parts, e.g. Login, Account or Settings. I usually like to experiment with architectural patterns like MVP or VIPER, but in order to keep the simplicity of the project I went with the good old MVC.

There's also a Resources folder that keeps all the images, storyboards and .plist

## Not everything is perfect

There's still a lot to be done in this project, these are some examples:
- Since the GET /ribots and GET /ribots/{id} endpoints return the same Ribot objects (I guess this only happens when accessing them without valid credentials) I decided to use only GET /ribots. If /ribots/{id} started providing more information then we would need to add a new endpoint to the API file, and modify the Ribot model.
- There is some repeated code in the MainCell and RibotDetailsViewController. This may be avoided by creating a reusable subclass of UIImageView that takes care of displaying the rounded avatar
- It would be nice if we could gain more control over the pull to dismiss animation in the RibotDetailsViewController, this could be achieved using Hero to implement an interactive transition in the ViewController


## How to install it

In order to enjoy it you will just need a Mac with XCode and cocoapods installed on it, you can grab cocoapods here if you don't have it already: [cocoapods](https://cocoapods.org/)

Then just open the terminal, cd into the project folder and do:

```
pod install
```

Grab a coffee, open the ribots.xcworkspace file that was just created and hit Run!


Thanks for reading this!
