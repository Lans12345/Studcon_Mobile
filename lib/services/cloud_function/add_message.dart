import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

Future addMessage(
  String myYear,
  String instructorProfile,
  String instructorName,
  String instructorEmail,
  String course,
  String message,
  String name,
  String email,
  String receiverId,
) async {
  final docUser = FirebaseFirestore.instance
      .collection(FirebaseAuth.instance.currentUser!.uid)
      .doc(receiverId)
      .collection('Messages')
      .doc();

  final box = GetStorage();

  final docUser1 = FirebaseFirestore.instance
      .collection(FirebaseAuth.instance.currentUser!.uid)
      .doc(receiverId);

  String tdata = DateFormat("hh:mm a").format(DateTime.now());

  final json = {
    'yearLevel': myYear,
    'profilePicture': instructorProfile,
    'course': course,
    'message': message,
    'name': name,
    'email': email,
    'concern': box.read('concern'),
    'time': tdata,
    'status': 'Unread',
    'myProfile': 'Unread',
    'id': docUser.id,
    'dateTime': DateTime.now(),
  };

  final json1 = {
    'yearLevel': myYear,
    'profilePicture': instructorProfile,
    'instructorName': instructorName,
    'instructorEmail': instructorEmail,
    'dateTime': DateTime.now(),
    'time': tdata,
    'status': 'Unread',
    'concern': box.read('concern'),
  };

  await docUser1.set(json1);

  await docUser.set(json);
}

Future addMessage2(
  String myYear,
  String myProfile,
  String instructorName,
  String instructorEmail,
  String course,
  String message,
  String name,
  String email,
  String receiverId,
) async {
  final docUser = FirebaseFirestore.instance
      .collection(receiverId)
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Messages')
      .doc();

  final box = GetStorage();

  String tdata = DateFormat("hh:mm a").format(DateTime.now());

  final json = {
    'yearLevel': myYear,
    'profilePicture': myProfile,
    'course': course,
    'message': message,
    'name': name,
    'email': email,
    'concern': box.read('concern'),
    'time': tdata,
    'id': docUser.id,
    'status': 'Unread',
    'dateTime': DateTime.now(),
  };

  final json1 = {
    'yearLevel': myYear,
    'name': name,
    'profilePicture': myProfile,
    'email': email,
    'dateTime': DateTime.now(),
    'time': tdata,
    'status': 'Unread',
    'concern': box.read('concern'),
  };

  final docUser1 = FirebaseFirestore.instance
      .collection(receiverId)
      .doc(FirebaseAuth.instance.currentUser!.uid);

  await docUser1.set(json1);

  await docUser.set(json);
}
