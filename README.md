# Flutter Micro Front Ends Architecture
  

This is a proposal of a micro front end implementation for Flutter apps.

As in per the micro services architecture, the micro apps can't know about the existence of other micro apps. 

They must be as simple as possible and be responsible for only one task of a subdomain (DDD).

It uses **Events** for communication between micro apps and also a **Router Manager** for generating and implementing the routing system.


See the diagrams below for a better overview.

<img src="__docs/1.png" width="650px"/>

<img src="__docs/2.png" width="650px"/>

## Example

Run the app from the `base_app/` directory.

## Creating a Micro App

To create a micro app you can user the [**Flutter Micro Front End Scaffolding Tool**](https://github.com/nobrefelipe/flutter-micro-front-end-scaffolding-tool).


Click on the link above and follow installation instructions, then in your micro apps folder run:
```
 $  scaffold mf <micro_app_name>
```


## Communication between micro front ends

The communication between micro front ends occurs via Events. 

Every micro app can register as many events as they need. The events are registred in the main app via the micro app resolver.
```dart
    // login_app_resolver.dart
    @override
    void initEventListeners() {
        CustomEventBus.on<UserLoggedOutEvent>((event) {
            print('LOGGED OUT');
        });
    }
```


### **Registering an event**

When you create a micro app with the `scaffold cli` it will create a `*_events.dart` file for you (eg.: search_events.dart) with some dummy events registred there to be used as examples.

Here is where you should register all events for your micro app.

```dart
    // search_events.dart 

    class SearchDummyEvent extends RouteEvent {
        final String user;
        SearchDummyEvent(this.user);
    }

    class SearchNotFountEvent extends RouteEvent{}
```

Then you need to export the events, so they are made available for the whole app.

We can export the events as functions that receive parameters that will be passed to the event itself or as getters.

```dart
    // search_events.dart

    class SearchEvents extends RouteEvent {
        RouteEvent dummyEvent(String user) => SearchDummyEvent(user);
        RouteEvent get searchNotFountEvent => SearchNotFountEvent();
        // More Search Events here
    }
```

We listen to events using the CustomEventBus class.

The code below listens to the `UserLoggedInEvent` and navigates to the home page as a reaction. 
```dart
    CustomEventBus.on<UserLoggedInEvent>((event) {
        Routing.pushNamed(Routes.home, arguments: event);
    });
```

## **Navigation**

Routing between micro front ends are managed by the Routing class.

We must register every route of the system in Routes. 

```dart
    // Routes
    class Routes extends Enum<String> {
        static Routes home = Routes(HomeResolver().microAppName);
    } 

    // Navigate to home
    Routing.pushNamed(Routes.home, arguments: someArgs);

```
### **Passing Arguments**

When you navigate using named routes you can pass arguments via contructor when you set up the routes for the micro app.

In the **micro app resolver** you register the routes in the `routes` getter and also define the arguments the view will receive.

The arguments must be of type `RouteEvent`. This is because we can navigate using the `Routing` class or via `Event`.

```dart
    // home_resolver.dart

    @override
    Map<String, WidgetBuilderArgs> get routes => {
        microAppName: (context, args) => HomeView(args as UserLoggedInEvent), //home_view.dart
    };

```

And you can get the argument passed like so:

```dart
    //home_view.dart

    class HomeView extends StatelessWidget {

        final UserLoggedInEvent args;
        HomeView(this.args);

        //...
    }
```

Then when you need to navigate to the Home Micro App:

```dart
    // See Using Micro Apps section below to konw how to register routes.

    Routing.pushNamed(
        Routes.home,
        arguments: RouteEvents.homeEvents.userLoggedInEvent('Felipe'),
    );
```



### **Route Tansitions**

You can use define the route transition for a micro app like so:
```dart
    //micro_app_resolver.dart
    
    @override
    TransitionType get transitionType => TransitionType.slideUp;
```


`TransitionType` is an enum with predefined transitions:
```dart
enum TransitionType {
  defaultTransition,
  none,
  fade,
  slideDown,
  slideUp,
  slideLeft,
  slideRight,
}
```



## Using Micro Apps
When you create a micro app you need to register it in two places.

This step is done manually so we can make available the right naming routes and events throughout the app.

* In the `base_app` (main.dart) `microApps` getter:
```dart
    @override
    List<MicroApp> get microApps => [
        //Register Micro Apps Resolvers here
        LoginResolver(),
        HomeResolver(),
        SearchResolver(),
    ];
```
* In the `routes.dart` in `micro_core/lib/services/routing/`:
```dart
    class Routes extends Enum<String> {
        Routes(String value) : super(value);

        //Register Micro Apps routes here
        static Routes home = Routes(HomeResolver().microAppName);
    }

    class RouteEvents {

        //Register Micro Apps events here
        static LoginEvents get loginEvents => LoginResolver().microAppEvents();
    }

```
Then we can use the routes and events like this:
```dart
    // Navigate to Login VIew
    Routing.pushNamed(Routes.login);

    // Emit UserLoggedOutEvent
    CustomEventBus.emit(RouteEvents.loginEvents.userLoggedOutEvent);

```
## Using a Micro App as a Widget
Sometimes you might need to export your micro app as a widget, meaning that you might not have an initial route for that or it's simply not a view.

For instance, you can have a `search_micro_app.dart` that exports a search text field that will navigate to a seach results page upon tapping on it.

In this case you can use the `microAppWidget()` method of your micro app. This method will export a widget that can be used by other micro apps.
Eg.:
```dart
    // in SearchMicroAppResolver
    @override
    Widget microAppWidget() => SearchButton();
```
The `microAppWidget()` method will be registred on the `WidgetsRegistry` when the base app is built and will be available to be used across the application like so:
```dart
    // in home_micro_app.dart
    Column: (
        children: [
            // Outputs the search micro app  widget.
            // note: the Home micro app has no idea what this will output.
            // The WidgetsRegistry is generated when the app builds.
            // This means we can include a Widget dynamicaly based on what an api tells us.
            WidgetsRegistry['/search'],
        ]
    )
   
```
This gives us a very powefull tool for **Feature Toggle** and **AB Testing**. The API can respond with a dynamic value for the widget making it easy to toggle a feature from the back end or showing different widgets based on the user.
```dart
    final String topBarWidget = someApiRespose(); // search
    WidgetsRegistry[topBarWidget],
```
Immagine we have a search API and somehow it breaks. Instead of showing erros to the user or breaking the app, we could just make that endpoint return another 
widget that could replace it for the time being.
