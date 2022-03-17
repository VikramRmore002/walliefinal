// import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Contact {
  late String _id;
  late String _phoneNumber;
  late String _firstname;
  late String _lastname;
  late String _email;
  late String _dateofbirth;
  late List _tops;
  late List _bottoms;
  Contact(this._firstname, this._lastname, this._email, this._dateofbirth,
      this._phoneNumber ,this._bottoms,this._tops);
  Contact.withId(this._id, this._firstname, this._lastname, this._email,
      this._dateofbirth, this._phoneNumber,this._bottoms,this._tops);

  // getters
  String get id => _id;
  String get firstname => _firstname;
  String get lastname => _lastname;
  String get email => _email;
  String get dateofbirth => _dateofbirth;
  String get phoneNumber => _phoneNumber;
  List  get tops => _tops;
  List  get bottoms => _bottoms;

  // setters

  set firstname(String firstname) {
    _firstname = firstname;
  }

  set lastname(String lastname) {
    _lastname = lastname;
  }

  set email(String email) {
    _email = email;
  }

  set dateofbirth(String dateofbirth) {
    _dateofbirth = dateofbirth;
  }

  set phoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
  }
  set bottoms(List bottoms){
    _bottoms = bottoms;
  }
  set tops (List tops){
    _tops = tops;
  }

  // Contact.formSnapshot(DataSnapshot snapshot){
  //   _id = snapshot.key!;
  //   _firstname = snapshot.value["firstName"];
  //   _lastname = snapshot.value["lastName"];
  //   _email = snapshot.value["email"];
  //   _dateofbirth = snapshot.value["dateOfBirth"];
  //   _phoneNumber = snapshot.value["phoneNumber"];
  //   _tops = snapshot.value["tops"]:
  //   _bottoms = snapshot.value["bottoms"]:
  // }

  Map<String, dynamic> toJson() {
    return {
      "firstName": _firstname,
      "lastName": _lastname,
      "email": _email,
      "dateOfBirth": _dateofbirth,
      "phoneNumber": _phoneNumber,
      "tops"    : _tops,
      "bottoms" : _bottoms
    };
  }
}
