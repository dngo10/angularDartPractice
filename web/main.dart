import 'package:angular/angular.dart';
import 'package:angular_app/app_component.template.dart' as ng;
import 'package:angular_router/angular_router.dart';

import 'main.template.dart' as self;

//To Tell Angular that your app uses the router,
//pass an argument to runApp() an injector seed with router ProvidersHash
@GenerateInjector(
  routerProvidersHash,
)

final InjectorFactory injector = self.injector$Injector;

void main() {
  runApp(ng.AppComponentNgFactory, createInjector: injector);
}

/**
 * Dependency Injection
 * 
 * This is an important app design pattern.
 * It's used so widely that almost everyone just call it DI.abstract 
 * 
 * DI is a style to get rid of requirements of parameters of the 
 * classes required.abstract
 * 
 * EXAMPLE: 
 * final Engine engine;
   final Tires tires;
   String description = 'DI';
   Car(this.engine, this.tires);

   The class Car is NOT SUPPOSED TO create engine and tires intance. These 2
   is supposed to be added INTO car, NOT BEING MADE/ GENERATE BY CAR.

   The Engine, or Tire, for whatever reason, should only be an interface/ or abstract class
   not the actual one.

   This is one of the reason why in C# they ONLY add INTERFACE, not actually class in it for the 
   purpose of keeping classes indepence from each other.

   The definition of the engine and tire dependencies are decoupled from  the Car class. You can
   pass in any kind of engine or tires you like, as long as they conform to the general API requirements
   of an engine or tires.

   IF SOMEONE EXTEND the Engine class, that is NOT Car's  problem.

   ++ REGISTER A SERVICE PROVIDER:

   A service is just a class (or a top-level function) until you register it with an Angular dependency injector

   An Angular injector is responsible for creating service instances and injecting them into classes like the HeroListComponent.

   Angular creates most injectors for you as it executes the app, including the app's root injector. When your app needs a 
   custom root injector, supply it as an argument to the runApp() function.

   You must register providers with an injector before the injector can create that service.

  @Component{
    providers: [ClassProvider(HeroService)]
  }

  An instance of the HeroService is now available for injection in this HeroesComponent and all of its child components.

  A component-provided service may have a limited lifetime. Each new instance of the component gets its own instance of the service
  and, when the component instance is destroyed, so is that service instance.

  Root injector provider:

  You can also register providers in the app's root injector, which you pass as an argument to the runApp() function.

  Use rootInjector provisioning for app-wide services declared external to the app package. Registering app specific services like
  HeroService is discouraged.abstract

  Inject a service:

  You can tell Angular to inject a dependency in the component's constructor by specifying a constructor parameter annotated with
  the dependency's type. 

  Singleton services:

  Services are singletons within the scope of an injector. There is at most one instance of a service in a given injector.

  However, Angular DI is a herachical injection system, which means that nested injectors can create their own service
  intstances. Angular creates nested injectors all the time.

  Component child injectors

  For example, when Angular creates an instance of a component that has @Component.providers, it also create a new child
  injector for that instance.

  Thanks to injector inheritance, you can still inject app-wide services into these components. A component's injector is
  a child of its parent component's injector, and a descendent of its parent's parent's injector, and so on all the way
  back to the app's root injector. Angular can inject a service provided by any injector in that lineage.

  When a service needs a service

  Because a singleton logger service is useful everywhere in the app, it's registered in AppComponent.

  providers: [ClassProvider(Logger)],

  Providers:

  A service provider provides a concrete, runtime instance associated with a dependency token. The injector relies on
  providers to creates instances of the services that the injector injects into components, directives, pipes, and other
  services.

  You must register a service provider with an injector, or the injector won't know how to create the service.abstract

  Class providers:

  providers: [ClassProvider(Logger)],

  Use-class provider:

  ClassProvider(Logger, useClass: BetterLogger)  

  Provider for a class with dependencies:

  class EvenBetterLogger extends Logger {
    final UserService _userService;

    EvenBetterLogger(this._userService);

    String get id => 'EvenBetterLogger';
    String toString() => super.toString() + ' (user:${_userService.user.name})';
  }

  Existing providers:

  Suppose an old component depends upon an OldLogger class. OldLogger has the same interface as the NewLogger, but
  for some reason you can't update the old component to use it.

  When the old component logs a message with OldLogger, you'd like the singleton instance of NewLogger to handle it
  instead.

  The dependency injector should inject that singleton instance when a component asks for either the new the old logger.
  The OldLogger should be an alias for NewLogger.

  You DO NOT WANT 2 diff NewLogger instances in your app. So don't do this:

  ClassProvider(NewLogger),
  ClassProvider(OldLogger, useClass: NewLogger),

  Instead, do this:

  ClassProvider(NewLogger),
  ExistingProvider(OldLogger, NewLogger),

  Value providers:

  Sometimes it's easier to provide a ready-made object rather than ask the injector to create it from a class.

  class SilentLogger implements Logger {
    const SilentLogger();
    String get id => 'SilentLogger';
    @override
    void fine(String msg) {}
    @override
    String toString() => '';
  }

  const silentLogger = SilentLogger(); // This is the core line

  THEN, on the other file:

  ValueProvider(Logger, silentLogger),

  FACTORY PROVIDERS:

  Use then information is provide untill very last minute or change along way.

  the HeroService constructor takes a boolean flag to control display of sercret heroes.

  final Logger _logger;
  final bool _isAuthorized;

  HeroService(this._logger, this._isAuthorized);

  List<Hero> getAll() {
    var auth = _isAuthorized ? 'authorized' : 'unauthorized';
    _logger.fine('Getting heroes for $auth user.');
    return mockHeroes.where((hero) => _isAuthorized || !hero.isSecret).toList();
  }

  final Logger _logger;
  final bool _isAuthorized;

  HeroService(this._logger, this._isAuthorized);

  List<Hero> getAll() {
    var auth = _isAuthorized ? 'authorized' : 'unauthorized';
    _logger.fine('Getting heroes for $auth user.');
    return mockHeroes.where((hero) => _isAuthorized || !hero.isSecret).toList();
  }

  You can inject the Logger, but you can't inject the boolean isAuthorized. You'll have to take
  over the creation of new instances of this HeroService with a factory provider.

  HeroService heroServiceFactory(Logger logger, UserService userService) =>
    HeroService(logger, userService.user.isAuthorized);

  Although the HeroService has no access to the UserService, the factory function does. ?????

  You inject both the Logger and the UserService into the factory provider and let the injector pass
  them along to the factory fucntion.

  const heroServiceProvider = FactoryProvider(HeroService, heroServiceFactory);

  Like the EvenBetterLogger, the HeroService needs a fact about the user.
  Unlike EvenBetterLogger, you can't inject the UserService into the HeroService. The HeroService won't
  have direct access to the user information to decide who is authorized and who is not.

  Notice that you captured the factory provider in a constant, heroServiceProvider. This extra step
  maeks the factory provider reusable. You can register the HeroService with this constant wherver you need
  it.

  Tokens:

  When you register a provider with an injector, you associate that provider with a dependency injection token.
  The injector maintains an internal map form tokens to providers that it references when asked for a dependency.

  Class types:

  In all previous examples, the token has been a blass type and the provided value an instance of that type.
  For example: you get a HeroService directly from the injector by supplying the HeroService type as the token.

  OpaqueToken:

  Sometimes the thing you want to inject is a string, list, map, or even a function.

  You know that a value provider is appropriate in this case, but what can you use as the token ? You could use
  String, but the won't work if your app depends on several such injected strings.

  One solution is to define and use OpaqueToken:

  // This solution sucks.

  When aservic needs a service... ?

  import '../logger_service

 */


/**
 * 
 * TEMPLATE SYNTAX
 * 
 * First: <script> element is NOT ACCEPTED
 * 
 * <html>, <body> and <base> is FOBIDDEN.
 * 
 * 
 * Interpolation: -- seen before
 * 
 * Template Expression: -- [property] = "expression"
 *    Assignment for it: (=, +=,-=, ++, --...)
 *    
 * Expression context: [hidden] = "isUnchanged"
 * 
 * The context for terms in an expression is a blend of the template variables.
 * If you reference a name that belongs to more than one of these namespaces,
 * the template variable name takes precedence, followed by a name in the dirctive's context,
 * and lastly, the component's member names.
 * 
 * The previous example presents such a name collision. The component has a hero property and the *ngFor
 * 
 * Template expressions can refer to top-level and static-member
 * 
 * Expression guidelines :: ANGULARDART 2.3.1
 * 
 * A template expression must not change any app state other than the value of the target property.
 * 
 * Template Statements:
 * 
 * (click) statement vs css statement.
 * 
 * Template expressions
 * 
 * 
 * 
 */