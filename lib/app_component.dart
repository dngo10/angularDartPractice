import 'package:angular/angular.dart';
import 'package:angular_app/src/employee.dart';
import 'package:angular_forms/angular_forms.dart';
import 'src/employee_component.dart';
import 'src/employees.dart';

@Component(
  selector: 'my-app',
  directives: [coreDirectives,formDirectives, EmployeeComponent],
  templateUrl: 'app_component.html',
  styleUrls: ['app_component.css'],
)

class AppComponent {
  var name = 'Gouvis Engineering Consulting Group';
  final title = 'Gouvis Group Title';
  var item = 'employee1';
  Employee selected = null;

  List<Employee> employeess = employees;

  void onSelect(Employee employee){
    this.selected = employee;
  }
}
