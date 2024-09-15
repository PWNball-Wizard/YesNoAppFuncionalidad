import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    //! Hacemos la petición a la API de yesno.wtf con dio y esperamos la respuesta
    final response = await _dio.get('https://yesno.wtf/api');

    //! Convertimos la respuesta a un objeto YesNoModel
    final yesNoModel = YesNoModel.fromJson(response.data);
    /* final answer = response.data['answer'];
    final image = response.data['image']; */

    //! Convertimos el objeto YesNoModel a un objeto Message y lo retornamos
    return yesNoModel.toMessageEntity();
  }
}
