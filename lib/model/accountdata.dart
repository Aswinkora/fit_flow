import 'package:cloud_firestore/cloud_firestore.dart';

class AccountModel {
  AccountModel(
      {required this.username,
      this.password,
      required this.name,
      required this.age,
      required this.weight});
  String name;
  int weight;
  int age;
  String username;
  dynamic password;
  Map<String, dynamic> tomap() {
    return {
      'name': name,
      'age': age,
      'weight': weight,
      'username': username,
      'password': password,
    };
  }
}

class AccountDatabase {
  CollectionReference<Map<String, dynamic>> database() {
    return FirebaseFirestore.instance.collection('AccountDatabase');
  }

  Future<void> senddata(AccountModel account) async {
    try {
      await database().add(account.tomap());
      print('Data added successfully');
    } catch (e) {
      print('Error:$e');
    }
  }

  Future<AccountModel?> getDataByUsername(String username) async {
    var query = await database().where('username', isEqualTo: username).get();
    if (query.docs.isNotEmpty) {
      var userData = query.docs.first.data();
      return AccountModel(
        name: userData['name'],
        age: userData['age'],
        weight: userData['weight'],
        username: userData['username'],
        password: userData['password'],
      );
    } else {
      return null;
    }
  }

  Future<bool> isUserAvailable(String username) async {
    final user = await FirebaseFirestore.instance
        .collection('AccountDatabase')
        .where('username', isEqualTo: username)
        .get();
    return user.docs.isEmpty;
  }

  Future<bool> updatePassword(String username, dynamic newPassword) async {
    try {
      var userQuery =
          await database().where('username', isEqualTo: username).get();
      if (userQuery.docs.isNotEmpty) {
        var docID = userQuery.docs.first.id;
        await database().doc(docID).update({'password': newPassword});
        print('Password updated successfully');
        return true;
      } else {
        print('User not found');
        return false;
      }
    } catch (e) {
      print('Error updating password: $e');
      return false;
    }
  }
}
