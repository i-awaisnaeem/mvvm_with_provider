import 'package:flutter/foundation.dart';
import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/data/network/NetworkApiServices.dart';
import 'package:mvvm/model/MoviesModel.dart';
import 'package:mvvm/resources/components/app_urls.dart';

class HomeRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<MoviesModel> fetchMoviesList() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrls.moviesListEndPoint);
      // Debugging print to check the response
      if (kDebugMode) {
        print('API Response: $response');
      }
      // Check if the response is null
      if (response == null) {
        throw Exception('API response is null');
      }
      return MoviesModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error in fetchMoviesList: $e');
      } // Debugging line
      throw e;
    }
  }
}
