import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../controllers/image_controller.dart';
import '../models/photo_model.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  final ImageController _controller = ImageController();
  final List<PhotoModel> _photos = [];

  void _addImage(ImageSource source) async {
    try {
      final photo = await _controller.pickImage(source);
      if (photo != null) {
        setState(() => _photos.add(photo));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro: ${e.toString()}")),
      );
    }
  }

void _showPhotoDetails(PhotoModel photo) {
  // importa o intl lá no topo do arquivo:
  // import 'package:intl/intl.dart';

  // Formata a data e hora no padrão brasileiro (dd/MM/yyyy HH:mm)
  final formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(photo.dateTime);

  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(photo.city ?? "Localização desconhecida"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("📍 Latitude: ${photo.latitude?.toStringAsFixed(5)}"),
          Text("📍 Longitude: ${photo.longitude?.toStringAsFixed(5)}"),
          const SizedBox(height: 8),
          Text("🕒 Data/Hora: $formattedDate"),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Fechar"),
        ),
      ],
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        title: const Text("Galeria com Localização"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: _photos.isEmpty
                ? const Center(
                    child: Text(
                      "Nenhuma foto ainda",
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: _photos.length,
                    itemBuilder: (context, index) {
                      final photo = _photos[index];
                      return GestureDetector(
                        onTap: () => _showPhotoDetails(photo),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(photo.imageFile, fit: BoxFit.cover),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _addImage(ImageSource.camera),
                  icon: const Icon(Icons.camera_alt_outlined),
                  label: const Text("Câmera"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => _addImage(ImageSource.gallery),
                  icon: const Icon(Icons.photo_library_outlined),
                  label: const Text("Galeria"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo.shade400,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
