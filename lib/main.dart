import 'package:custom_sf_grid_view/models/employee_model.dart';
import 'package:custom_sf_grid_view/src/datagrid_widget/runtime/column.dart';
import 'package:custom_sf_grid_view/viewmodel/datasources/employee_local_source.dart';
import 'package:flutter/material.dart';

import 'package:custom_sf_grid_view/custom_sf_grid_view.dart';

import 'custom_sf_grid_view.dart';

void main() async {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        SfLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'),
      ],
      home: GridExample()));
}

class GridExample extends StatefulWidget {
  const GridExample({super.key});

  @override
  State<GridExample> createState() => _GridExampleState();
}

class _GridExampleState extends State<GridExample> {
  late EmployeeDataSource employeeDataSource;

  List<EmployeeModel> getEmployeeData() {
    return [
      EmployeeModel(10001, 'James', 'Project Lead', 20000),
      EmployeeModel(10002, 'Kathryn', 'Manager', 30000),
      EmployeeModel(10003, 'Lara', 'Developer', 15000),
      EmployeeModel(10004, 'Michael', 'Designer', 15000),
      EmployeeModel(10005, 'Martin', 'Developer', 15000),
      EmployeeModel(10006, 'Newberry', 'Developer', 15000),
      EmployeeModel(10008, 'Perry', 'Developer', 15000),
      EmployeeModel(10009, 'Gable', 'Developer', 15000),
      EmployeeModel(10010, 'Grimes', 'Developer', 15000),
      EmployeeModel(10001, 'James', 'Project Lead', 20000),
      EmployeeModel(10002, 'Kathryn', 'Manager', 30000),
      EmployeeModel(10003, 'Lara', 'Developer', 15000),
      EmployeeModel(10004, 'Michael', 'Designer', 15000),
      EmployeeModel(10005, 'Martin', 'Developer', 15000),
      EmployeeModel(10006, 'Newberry', 'Developer', 15000),
      EmployeeModel(10008, 'Perry', 'Developer', 15000),
      EmployeeModel(10009, 'Gable', 'Developer', 15000),
      EmployeeModel(10010, 'Grimes', 'Developer', 15000),
      EmployeeModel(10001, 'James', 'Project Lead', 20000),
      EmployeeModel(1000892, 'Kathryn', 'Manager', 30000),
      EmployeeModel(100073, 'Lara', 'Developer', 15000),
      EmployeeModel(10004, 'Michael', 'Designer', 15000),
      EmployeeModel(100505, 'Martin', 'Developer', 15000),
      EmployeeModel(100046, 'Newberry', 'Developer', 15000),
      EmployeeModel(1112, 'Perry', 'Developer', 15000),
      EmployeeModel(1041009, 'Gable', 'Developer', 15000),
      EmployeeModel(104010, 'Grimes', 'Developer', 15000),
      EmployeeModel(10001, 'James', 'Project Lead', 20000),
      EmployeeModel(10002, 'Kathryn', 'Manager', 30000),
      EmployeeModel(10003, 'Lara', 'Developer', 15000),
      EmployeeModel(10004, 'Michael', 'Designer', 15000),
      EmployeeModel(10005, 'Martin', 'Developer', 15000),
      EmployeeModel(10006, 'Newberry', 'Developer', 15000),
      EmployeeModel(10008, 'Perry', 'Developer', 15000),
      EmployeeModel(10009, 'Gable', 'Developer', 15000),
      EmployeeModel(10010, 'Grimes', 'Developer', 15000)
    ];
  }

  @override
  void initState() {
    super.initState();
    List<EmployeeModel> employees = getEmployeeData();
    employeeDataSource = EmployeeDataSource(employeeData: employees);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: CustomizedGridView(
            shrinkWrapRows: true,
            source: employeeDataSource,
            onClickFilter: (GridColumn gridColumn,
                DataGridFilterHelper filterHelper) async {
              List<FilterElement> filteredItems = filterHelper
                  .checkboxFilterHelper.filterCheckboxItems
                  .where((element) => element.isSelected)
                  .toList();

              AlertDialog alert = AlertDialog(
                elevation: 3,
                title: Text(gridColumn.columnName),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("The filtered items is/are:\n"),
                    SizedBox(
                      height: 20,
                      width: 200,
                      child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: false,
                        itemBuilder: (context, index) {
                          return Text(filteredItems[index].value.toString());
                        },
                        itemCount: filteredItems.length,
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 2);
                        },
                      ),
                    )
                  ],
                ),
                actions: [
                  TextButton(
                    child: const Text("HIDE"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
              await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );
            },
            allowFiltering: true,
            columns: [
              GridColumn(
                  columnName: 'id',
                  filterIconPosition: ColumnHeaderIconPosition.end,
                  filterPopupMenuOptions: const FilterPopupMenuOptions(
                    canShowClearFilterOption: true,
                    canShowSortingOptions: true,
                    filterMode: FilterMode.advancedFilter,
                    showColumnName: true,
                  ),
                  label: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        'ID',
                      ))),
              GridColumn(
                  columnName: 'name',
                  label: Container(
                      padding: const EdgeInsets.all(16.0),
                      alignment: Alignment.centerLeft,
                      child: const Text('Name'))),
              GridColumn(
                  columnName: 'designation',
                  width: 120,
                  label: Container(
                      padding: const EdgeInsets.all(16.0),
                      alignment: Alignment.centerLeft,
                      child: const Text('Designation'))),
              GridColumn(
                  columnName: 'salary',
                  label: Container(
                      padding: const EdgeInsets.all(16.0),
                      alignment: Alignment.centerRight,
                      child: const Text('Salary'))),
            ],
          ),
        ),
      ],
    ));
  }
}
