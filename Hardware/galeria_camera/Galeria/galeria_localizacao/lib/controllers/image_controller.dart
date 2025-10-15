import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../models/photo_model.dart';
import '../services/location_service.dart';
import '../services/weather_service.dart';

class ImageController {
  final ImagePicker _picker = ImagePicker();
  final LocationService _locationService = LocationService();
  final WeatherService _weatherService = WeatherService();

  Future<PhotoModel?> pickImage(ImageSource source) async {//pega a imagem
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile == null) return null;

    final position = await _locationService.getCurrentPosition();
    final city =
        await _weatherService.getCityName(position.latitude, position.longitude);

    return PhotoModel(
      imageFile: File(pickedFile.path),
      latitude: position.latitude,
      longitude: position.longitude,
      city: city,
    );
  }
}
