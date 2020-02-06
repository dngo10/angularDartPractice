import 'package:angular/angular.dart';
import 'package:angular_app/src/router_paths.dart';
import 'package:angular_app/src/routes.dart';
import 'src/employee_service.dart';
import 'package:angular_router/angular_router.dart';


@Component(
  selector: 'my-app',
  directives: [coreDirectives, routerDirectives],
  templateUrl: 'app_component.html',
  styleUrls: ['app_component.css'],
  exports: [RoutePaths, Routes],

  //Add Provider for Dependency Injection
  providers: [ClassProvider(EmployeeService)],
)

class AppComponent{ // ngOnInit MUST IMPLEMENTS IT
  final title = 'Gouvis Group';
}