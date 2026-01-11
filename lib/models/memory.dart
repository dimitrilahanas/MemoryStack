import 'package:hive/hive.dart';

part 'memory.g.dart';

@HiveType(typeId: 0)
class Memory extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final String lastCompleted;

  Memory({
    required this.name,
    required this.description,
    required this.lastCompleted,
  });
}
