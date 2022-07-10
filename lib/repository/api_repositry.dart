import 'package:api_with_getx/api_service/endpoint.dart';

import 'package:flutter/foundation.dart';
import '../api_service/api_response/user_details_model.dart';
import '../api_service/endpoint_calling_service.dart';

class ApiRepository {
  static final ApiRepository apiRepository = ApiRepository._internal();

  factory ApiRepository() {
    return apiRepository;
  }

  ApiRepository._internal();

  /// In this class we can declare our repositories as per our need.
  Future<dynamic> dummyRepository() async {}

  Future<UserDetailsModel?> userDetailsRepository() async {
    try {
      final response =
          await EndpointCallingService().getDataRequest("users?page=2");
      final parsedResponse = UserDetailsModel.fromJson(response.data);

      return parsedResponse;
    } on Exception catch (e) {
      if (kDebugMode) {
        print("ApiRepository>>>>>>>${e.toString()}");
      }
      return null;
    }
  }
}
