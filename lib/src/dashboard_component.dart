import 'package:angular/angular.dart';
import 'package:angular_app/src/router_paths.dart';
import 'package:angular_router/angular_router.dart';
import 'employee.dart';
import 'employee_service.dart';

@Component(
  selector:  'my_dashboard',
  templateUrl: 'dashboard_component.html',
  directives: [coreDirectives, routerDirectives],
  providers: [ClassProvider(EmployeeService)]
)

class DashboardComponent implements OnInit{

  List<Employee> employees;
  final EmployeeService _employeeService;

  DashboardComponent(this._employeeService);

  @override
  void ngOnInit() async{
    employees = (await _employeeService.getAll()).skip(1).take(4).toList();
  }

  String employeeUrl(int id){
    return RoutePaths.employee.toUrl(parameters: {idParam: '$id'});
  }
}