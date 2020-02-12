import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'employee.dart';

import 'employee_service.dart';
import 'router_paths.dart';



@Component(
  selector: 'my-employee',
  templateUrl: 'employee_component.html',
  directives: [coreDirectives, formDirectives],
)

class EmployeeComponent implements OnActivate{
  final EmployeeService _employeeService;
  final Location _location;
  Employee employee;

  EmployeeComponent(this._employeeService, this._location);

  @override
  void onActivate(_, RouterState current) async{
    final id = getId(current.parameters);
    if(id != null) employee = await (_employeeService.get(id));
  }

  int getId(Map<String, String> parameters){
    final id = parameters[idParam];
    return id == null ? null : int.tryParse(id);
  }

  void goBack() => this._location.back();
}