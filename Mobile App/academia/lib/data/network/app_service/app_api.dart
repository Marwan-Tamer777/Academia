import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';


import '../../../app/constants.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class AppAPIServiceClient {
  factory AppAPIServiceClient(Dio dio, {String baseUrl}) = _AppAPIServiceClient;


}
