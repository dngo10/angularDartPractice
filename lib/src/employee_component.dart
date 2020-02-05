import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'employee.dart';

@Component(
  selector: 'my-employee',
    template: '''
    <div *ngIf="employee != null">
      <h2>{{employee.name}}</h2>
      <div><label>id: </label>{{employee.id}}</div>
      <div>
        <label>name: </label>
        <input [(ngModel)]="employee.name" placeholder="name">
      </div>
    </div>''',
  directives: [coreDirectives, formDirectives],
)

class EmployeeComponent{

  @Input()
  Employee employee;
}