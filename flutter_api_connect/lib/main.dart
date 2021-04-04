import 'package:flutter/material.dart';
import 'package:flutter_api_connect/userprofile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _globalKey = GlobalKey<FormState>();
  var userProfile = UserProfile();

  @override
  Widget build(BuildContext context) {
    userProfile.isActive = false;

    return Scaffold(
      appBar: AppBar(
        title: Text('Carved Rock Fitness'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _globalKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(hintText: 'First Name'),
                    validator: (currentValue) {
                      if (currentValue.isEmpty) {
                        return 'First name Is Required';
                      }
                    },
                    onSaved: (currentValue) {
                      userProfile.firstName = currentValue;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Last Name'),
                    validator: (currentValue) {
                      if (currentValue.isEmpty) {
                        return 'Last name Is Required';
                      }
                    },
                    onSaved: (currentValue) {
                      userProfile.lastName = currentValue;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Loyalty Points'),
                    keyboardType: TextInputType.number,
                    validator: (currentValue) {
                      if (int.parse(currentValue) <= 0) {
                        return 'Loyalty Points must be greater than Zero';
                      }
                    },
                    onSaved: (currentValue) {
                      userProfile.loyaltyPoints = int.parse(currentValue);
                    },
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(hintText: 'Fitness Goal'),
                    onChanged: (newValue) {},
                    items: [
                      ['Lose Weight', 1],
                      ['Build Muscle', 2],
                      ['Trains for sport', 3],
                      ['Recreation', 4],
                    ].map((item) {
                      return DropdownMenuItem(
                        child: Text(item[0]),
                        value: item[1],
                      );
                    }).toList(),
                    onSaved: (currentValue) {
                      userProfile.fitnessGoal = currentValue;
                    },
                  ),
                  SwitchListTile(
                      value: userProfile.isActive,
                      onChanged: (newValue) {
                        setState(() {
                          userProfile.isActive = newValue;
                        });
                      }),
                  ElevatedButton(
                    child: Text('Submit'),
                    onPressed: () {
                      var _message = '';
                      if (_globalKey.currentState.validate()) {
                        _globalKey.currentState.save();
                        _message = userProfile.toJson();
                      } else {
                        _message = 'There was an Error in the Form';
                      }
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: Text('Generated JSON'),
                              content: Text(_message),
                              actions: [
                                TextButton(onPressed: () {}, child: Text('OK'))
                              ],
                            );
                          });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
