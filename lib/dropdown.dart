import 'package:flutter/material.dart';

class dropdown extends StatelessWidget {
  dropdown({
    Key key,
    @required this.listItem,
    @required this.dropDownOnChange,
    @required this.newValue,
  }) : super(key: key);

  List<String> listItem;
  final String newValue;
  Function dropDownOnChange;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: listItem.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      value: newValue,
      onChanged: (String changeValue) {
        dropDownOnChange:
        dropDownOnChange(changeValue);
      },
    );
  }
}
