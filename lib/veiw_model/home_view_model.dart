import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/data/response/api_response.dart';
import 'package:mvvm/model/MoviesModel.dart';
import 'package:mvvm/repository/home_repository.dart';

class HomeViewViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();

  ApiResponse<MoviesModel> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MoviesModel> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesListApi() async {
    setMoviesList(ApiResponse.loading());

    if (kDebugMode) {
      print('Fetching movies');
    }

    _myRepo.fetchMoviesList().then((value) {
      setMoviesList(ApiResponse.completed(value));

      if (kDebugMode) {
        print('Movies fetched');
      }
    }).onError((error, stackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }
}
