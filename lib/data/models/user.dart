import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject{

  @HiveField(0)
  String? id;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String password;

  @HiveField(3)
  final String fullname;

  User({
    required this.username,
    required this.password,
    required this.fullname
  });
}