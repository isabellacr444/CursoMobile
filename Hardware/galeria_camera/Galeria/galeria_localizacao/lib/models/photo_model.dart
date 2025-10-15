import 'dart:io';

class PhotoModel {
  final File imageFile;
  final String? city;
  final double? latitude;
  final double? longitude;
  final DateTime dateTime; // <-- novo campo

  PhotoModel({
    required this.imageFile,
    this.city,
    this.latitude,
    this.longitude,
    DateTime? dateTime,
  }) : dateTime = dateTime ?? DateTime.now(); // gera automaticamente
}
