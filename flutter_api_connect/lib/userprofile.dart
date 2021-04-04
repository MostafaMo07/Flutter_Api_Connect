import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

// class UserProfile {
//   String firstName;
//   String lastName;
//   int loyaltyPoints;
//   int fitnessGoal;
//   bool isActive;

//   UserProfile() {
//     this.isActive = false;
//   }
// }

class UserProfile {
  String firstName;
  String lastName;
  int loyaltyPoints;
  int fitnessGoal;
  bool isActive;

  String toJson() {
    Map<String, dynamic> userMap = {
      'firstName': this.firstName,
      'lastName': this.lastName,
      'loyaltyPoints': this.loyaltyPoints,
      'fitnessGoal': this.fitnessGoal,
      'isActive': this.isActive
    };
    var data = jsonEncode(userMap);
    return data;
  }
}
