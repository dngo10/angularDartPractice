import 'package:angular/angular.dart';
import 'employee.dart';
import 'employee_service.dart';

@Component(
  selector:  'my_dashboard',
  templateUrl: 'dashboard_component.html',
  directives: (coreDirectives),
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
}