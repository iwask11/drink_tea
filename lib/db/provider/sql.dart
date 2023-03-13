import 'dart:async';

import 'package:drink_tea/db/sqlManager.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   Future<void> insertDog(Dog dog) async {
//     final db = await database;
//
//     await db.insert(
//       'dogs',
//       dog.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }
//
//   Future<List<Dog>> dogs() async {
//     final db = await database;
//
//     final List<Map<String, dynamic>> maps = await db.query('dogs');
//
//     return List.generate(maps.length, (i) {
//       return Dog(
//         id: maps[i]['id'],
//         name: maps[i]['name'],
//         age: maps[i]['age'],
//       );
//     });
//   }
//
//   Future<void> updateDog(Dog dog) async {
//     final db = await database;
//
//     await db.update(
//       'dogs',
//       dog.toMap(),
//       where: 'id = ?',
//       whereArgs: [dog.id],
//     );
//   }
//
//   Future<void> deleteDog(int id) async {
//     final db = await database;
//
//     await db.delete(
//       'dogs',
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//   }
//
//   var fido = const Dog(
//     id: 0,
//     name: 'Fido',
//     age: 35,
//   );
//
//   await insertDog(fido);
//
//   // Now, use the method above to retrieve all the dogs.
//   print(await dogs()); // Prints a list that include Fido.
//
//   // Update Fido's age and save it to the database.
//   fido = Dog(
//     id: fido.id,
//     name: fido.name,
//     age: fido.age + 7,
//   );
//   await updateDog(fido);
//
//   // Print the updated results.
//   print(await dogs()); // Prints Fido with age 42.
//
//   // Delete Fido from the database.
//   await deleteDog(fido.id);
//
//   // Print the list of dogs (empty).
//   print(await dogs());
// }
//
// class Dog {
//   final int id;
//   final String name;
//   final int age;
//
//   const Dog({
//     required this.id,
//     required this.name,
//     required this.age,
//   });
//
//   // Convert a Dog into a Map. The keys must correspond to the names of the
//   // columns in the database.
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'age': age,
//     };
//   }
//
//   // Implement toString to make it easier to see information about
//   // each dog when using the print statement.
//   @override
//   String toString() {
//     return 'Dog{id: $id, name: $name, age: $age}';
//   }
// }