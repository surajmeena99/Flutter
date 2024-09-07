import 'package:hive/hive.dart';

part 'HiveUserLocation.g.dart'; // Generated file

@HiveType(typeId: 6) // Unique type id for PolygonPointsModel
class HiveUserLocation extends HiveObject {

  @HiveField(0)
  String? latitude;

  @HiveField(1)
  String? longitude;


  @HiveField(2)
  String? userId;

  HiveUserLocation({
    this.latitude,
    this.longitude,
    this.userId,
  });
}

