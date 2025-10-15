import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = "e36145c90b2091efaa7be9b454640d87"; // <-- Coloque sua chave da OpenWeatherMap

  Future<String?> getCityName(double lat, double lon) async {
    final url = Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&lang=pt_br",
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["name"];
    } else {
      return null;
    }
  }
}
