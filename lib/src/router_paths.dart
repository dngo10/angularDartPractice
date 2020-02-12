import 'package:angular_router/angular_router.dart';

/**
 * Routes tell the router which views to display when a user clicks a link or pastes
 * a URL into the browser address bar.
 */

const idParam = 'id';

// This is to create a routePath.
class RoutePaths{
  static final RoutePath employees = RoutePath(path: 'employees');
  static final RoutePath dashboard = RoutePath(path: 'dashboard');
  static final RoutePath employee  = RoutePath(path: '${employees.path}/:$idParam');
  // The colon (:) in the path indicates that :$idParen (:id) is a placeholder for a specific
  // employee ID when navigating to hero view.

  static final RoutePath super_employee = RoutePath(path: 'superemployee');

  
}

/**
 * Angular apps are modular; that is apps are assembled from many modules.
 * 
 * Every Angular app has at least one module, the root module. 
 * While the root module may be the only module in a small app, most apps have many more feature modules
 * each a cohesive block of code dedicated to an application domain, a workflow, or a closely related set
 * of capabilities.
 * 
 * Angular ships as a collection of libraries within the angular package. The main Angular library is
 * angular.
 * 
 * 
 * Component:
 * 
 * A component control a patch of screen called a view.
 * 
 * You define a component's application logic -- what it does to support the view -- inside a class.abstract
 * The class interacts with the view through an API of properties and methods.abstract
 * 
 * Angular creates, updates, and destroys components as the user moves through the app. You app con take action at
 * each moment in this lifecycle through optional lifecycle hooks, like ngOnInit()
 * 
 * 
 * Template:
 * 
 * You define a component's view with its companion template. A template is a form of HTML that tells Angular how
 * to render the component.
 * 
 * A template look like regular HTML, except for a few differences.
 * The template uses typical HTML elements likfe <h2> and <p> ++++ *ngFor, {{class.variableName}}, (action), [directive], <component>
 * 
 * 
 * Metadata:
 * 
 * Metadata tells Angular how to process a class.
 *    This is done by using "annotation".
 * 
 * @Component annotation accepts parameters supplying the information Angular needs to create and present the component and its view.
 * 
 * selector: a CSS selector that tells Angular to create and insert an instance of this component.
 * templateUrl: the module-relative address of this component's HTML template.
 * directives: a list of components or directives that this template requires. For Angular to process app tags that appear in the
 * template, you must declare the tag's corresponding component in the directives list.
 * 
 * Databinding
 * 
 * Without a framework, you're responsible for pushing data varlues into the HTML controls and turning user responses
 * into actions and value updates. Writing such push/pull logic by hand is tedious and error prone, and the result is
 * difficult the read.
 * 
 * Angular supports data binding, a mechanism for corrodinating parts of a template with parts of a component. Add binding markup to the
 * template HTML to tell Angular how to connect the template and the component.
 * 
 *  <--- {{value}} (interpolation -- nội suy)
 *  <--- [property] = "value" (passed value from parent to child (using with input))
 *  <--- (event) = "handler" (event binding) called the component's method.
 * 
 *  
 *  TWO-WAY DATA BINDING
 *  [(ng-model)] = "property"
 *  <------------------------>
 *  
 *  TWO-WAY DATA BINDING combines property and event binding in a single notation, using the ngModel directive. In two-way binding,
 *  a data property flows to the input box from the component as with property binding. The user's changes also flow back to the 
 *  component, resetting the property to the lastest value, as with event binding.abstract
 * 
 *  Angular processes all data bindings once per JavaScript event cycle, from the root of the app component tree through all child
 *  components.
 *  
 *  DIRECTIVES:
 * 
 *  Angular templates are dynamic. When renders them, it transforms the DOM according to the instructions given by directives.
 *  
 *  Directive is a class with a @Directive annotation. A component is a directive with a template; a @Component annotation is
 *  actual a @Directive annotation extended with template-oriented features.
 * 
 *  There are 2 kinds of directives: STRUCTURAL and ATTRIBUTE directives
 * 
 *  They tend to appear within an element tag in the same way as attributes, sometimes specified by name but more often as the target
 *  of an assignment or a binding.
 * 
 *  Structural directives:
 *      + alter laout by adding, removing, and replacing elements in the DOM.abstract
 *          *ngFor, *ngIf
 * 
 *  Attribute directives:
 *      + alter the appearance or behavior of an existing element. Im templates they look like regular HTML attributes, hence the name.
 */