// import 'package:cloud_firestore/cloud_firestore.dart';

// class UserModel {
//   final String id;
//   final String firstName;
//   final String lastName;
//   final String userName;
//   final String email;
//   final String number;

//   UserModel({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     required this.userName,
//     required this.email,
//     required this.number,
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       'FirstName': firstName,
//       'LastName': lastName,
//       'UserName': userName,
//       'Email': email,
//       'PhoneNumber': number,
//     };
//   }

//   factory UserModel.fromSnapshot(
//       DocumentSnapshot<Map<String, dynamic>> document) {
//     final data = document.data()!;
//     return UserModel(
//       id: document.id,
//       firstName: data['FirstName'] ?? '',
//       lastName: data['LastName'] ?? '',
//       userName: data['UserName'] ?? '',
//       email: data['Email'] ?? '',
//       number: data['PhoneNumber'] ?? '',
//     );
//   }
// }
