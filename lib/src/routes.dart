import 'package:angular_router/angular_router.dart';
import 'router_paths.dart';
import 'employee_list_component.template.dart' as employee_list_template;
import 'dashboard_component.template.dart' as dashboard_template;
import 'employee_component.template.dart' as employee_template;

export 'router_paths.dart';

class Routes{
  static final employees = RouteDefinition(
    routePath: RoutePaths.employees, 
    component: employee_list_template.EmployeeListComponentNgFactory
  );

  static final dashboard = RouteDefinition(
    routePath: RoutePaths.dashboard,
    component: dashboard_template.DashboardComponentNgFactory
  );

  static final employee = RouteDefinition(
    routePath: RoutePaths.employee,
    component: employee_template.EmployeeComponentNgFactory
  );

  /**
   * RouteDefinition (This is the description of the route)
   * routePath: The router mathces this path against the URL in the browser bar (employees)
   * component: the (factory of the) component that will be activated when this route is
   * navigaged to (employee_list_template.EmployeeListComponentNgFactory)
   */

  // For each route, you are suppose to one more like above
  
  static final all = <RouteDefinition>[
    employees, 
    dashboard,
    RouteDefinition.redirect(path: '', redirectTo: RoutePaths.dashboard.toUrl()),
    employee
    ];
  // The Routes.all field is a list of route definitions. It contains
  // only one route, but you'll be adding be adding more routes shortly.
  // 
}