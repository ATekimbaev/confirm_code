import 'package:dio/dio.dart';
import 'package:token/core/url_routes.dart';
import 'package:token/data/models/registr_model.dart';

class AuthRepositroy {
  final Dio dio;
  AuthRepositroy({required this.dio});

  Future<String> registr({
    required RegitsrModel model,
  }) async {
    final Response response = await dio.post(
      UrlRoutes.regisr,
      data: model.toJson(),
    );
    return response.data["message"];
  }

  Future<String> confirmCode({
    required String code,
  }) async {
    final Response response = await dio.post(
      UrlRoutes.confirmCode,
      data: {"code": code},
    );
    return response.data["message"];
  }
}
