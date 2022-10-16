import 'package:elmawkef_inc/app/models/gender.dart';
import 'package:flutter/material.dart';

class Gender extends StatelessWidget {
  GenderModel _gender;

  Gender(this._gender);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _gender.isSelected ? Color(0xFF3B4257) : Colors.white,
      child: Container(
        height: 70,
        width: 70,
        alignment: Alignment.center,
        margin: EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              _gender.icon,
              color: _gender.isSelected ? Colors.white : Colors.grey,
              size: 40,
            ),
            SizedBox(height: 10),
            Text(
              _gender.name,
              style: TextStyle(
                  color: _gender.isSelected ? Colors.white : Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
