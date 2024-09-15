// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromJson(jsonString);

import 'dart:convert';

import 'package:yes_no_app/domain/entities/message.dart';

//! En caso de que recibamos la respuesta de la API en un String, podemos convertirlo a un objeto YesNoModel de la siguiente manera:
YesNoModel yesNoModelFromJson(String str) =>
    YesNoModel.fromJson(json.decode(str));

//! En caso de que queramos convertir un objeto YesNoModel a un String, podemos hacerlo de la siguiente manera:
//! Sirve para mandar a peticiones HTTP, hacer post, put, etc.
String yesNoModelToJson(YesNoModel data) => json.encode(data.toJson());

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  //! Constructor de la clase YesNoModel
  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  //! Método que convierte un objeto JSON en un objeto YesNoModel de la siguiente manera:
  factory YesNoModel.fromJson(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  //! Método que convierte un objeto YesNoModel en un objeto JSON de la siguiente manera:
  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  //! Método que convierte un objeto YesNoModel en un objeto Message de la siguiente manera:
  Message toMessageEntity() {
    return Message(
        text: answer == 'yes' ? 'Si' : 'No',
        imageURL: image,
        fromWho: FromWho.hers);
  }
}
