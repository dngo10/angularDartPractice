import 'employee.dart';
import 'employees.dart';

/**
 * At the momment, AppComponent defines list of employees to display.
 * However, "defining" employees is not the component's job, and you
 * can't easily share the list of employees, and you can't easily share the list
 * if employees with other components and views. In this page, you will move the hero
 * data acqusition business to a single service that provides the data and share the
 * service with all components that need the data.
 * 
 * 
 */

class EmployeeService{
  Future<List<Employee>> getAll() async => employees;
}