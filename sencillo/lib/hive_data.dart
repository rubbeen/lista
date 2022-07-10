import 'package:hive_flutter/adapters.dart';
import 'package:sencillo/contact.dart';

class HiveData {
  const HiveData();

  Future<int> saveContact(Contac contac) async {
    final Box<Contac> box = await Hive.openBox<Contac>('contacts');
    return box.add(contac);
  }

  Future<List<Contac>> get contacts async{
    final Box<Contac> box = await Hive.openBox<Contac>('contacts');
    return box.values.toList();
  }
}
