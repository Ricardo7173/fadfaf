import 'package:orgg_yes_app/domain/entities/message.dart';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJson(Map<String, dynamic> json) {
    final String answer = json['answer']; // Obtener la respuesta directamente de la API
    final String imageUrl = json['image']; // Obtener la URL de la imagen

    return YesNoModel(
      answer: answer,
      forced: json['forced'],
      image: imageUrl,
    );
  }

  Message toMessageEntity() => Message(
    text: answer == 'yes' ? '¡Sí!' : '¡No!',
    fromWho: FromWho.her,
    imageUrl: image,
  );
}
