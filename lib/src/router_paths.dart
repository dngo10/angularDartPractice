import 'package:angular_router/angular_router.dart';

/**
 * Routes tell the router which views to display when a user clicks a link or pastes
 * a URL into the browser address bar.
 */

const idParam = 'id';

// This is to create a routePath.
class RoutePaths{
  static final employees = RoutePath(path: 'employees');
  static final dashboard = RoutePath(path: 'dashboard');
  static final employee = RoutePath(path: '${employees.path}/$idParam');

}