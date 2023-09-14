import 'package:custom_sf_grid_view/custom_sf_grid_view.dart';
import 'package:custom_sf_grid_view/models/employee_model.dart';
import 'package:flutter/material.dart';

class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({required List<EmployeeModel> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<int>(columnName: 'id', value: e.id),
      DataGridCell<String>(columnName: 'name', value: e.name),
      DataGridCell<String>(
          columnName: 'designation', value: e.designation),
      DataGridCell<int>(columnName: 'salary', value: e.salary),
    ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        color: Colors.greenAccent,
        cells: row.getCells().map<Widget>((e) {
          return Container(
            color: Colors.blue,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: Text(e.value.toString(),
                style: const TextStyle(color: Colors.white)),
          );
        }).toList());
  }
}