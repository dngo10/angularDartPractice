import 'package:angular/angular.dart';
import 'package:angular_app/src/employee_component.dart';
import 'employee_service.dart';
import 'employee.dart';

@Component(
  selector: 'my-employees',
  templateUrl: 'employee_list_component.html',
  styleUrls: ['employee_list_component.css'],
  directives: [coreDirectives, EmployeeComponent],
  providers: [ClassProvider(EmployeeService)]
)

class EmployeeListComponent implements OnInit{
  EmployeeService _employeeService;


  EmployeeListComponent(this._employeeService);

  @override
  void ngOnInit(){
    this._getEmployeess();
  }

  Employee selected = null;

  List<Employee> employeess;

  Future<void> _getEmployeess() async{
    //_employeeService.getAll().then((employees) => this.employeess = employees); //You can do this way
    employeess = await _employeeService.getAll();
  }

  void onSelect(Employee employee){
    this.selected = employee;
  }
}