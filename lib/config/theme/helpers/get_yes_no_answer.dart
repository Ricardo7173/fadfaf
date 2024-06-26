import 'package:dio/dio.dart';
import 'package:orgg_yes_app/domain/entities/message.dart';
import 'package:orgg_yes_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final Dio _dio = Dio();

  Future<Message> getAnswer() async {
    try {
      final response = await _dio.get('https://yesno.wtf/api');
      final yesNoModel = YesNoModel.fromJson(response.data);
      return yesNoModel.toMessageEntity();
    } catch (e) {
      print('Error fetching yes/no answer: $e');
      throw Exception('Failed to get answer from API');
    }
  }
}