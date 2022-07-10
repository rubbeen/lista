import 'package:hive_flutter/hive_flutter.dart';
part 'contact.g.dart';

@HiveType(typeId: 0)
class Contac extends HiveObject{
  Contac({required this.name, required this.number});

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String number;
}
