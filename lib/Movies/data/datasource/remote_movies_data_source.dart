import 'package:dio/dio.dart';
import 'package:movies_app/Movies/data/model/modle_movies.dart';
import 'package:movies_app/Movies/data/model/movies_detail_model.dart';
import 'package:movies_app/Movies/data/model/recommendation_model.dart';
import 'package:movies_app/Movies/domain/usecase/get_movie_detail_use_case.dart';
import 'package:movies_app/Movies/domain/usecase/get_movies_recommendation_use_case.dart';
import 'package:movies_app/core/exception_error/exseptions.dart';
import 'package:movies_app/core/network/error_model.dart';
import 'package:movies_app/core/utils/app_constances.dart';

abstract class baseRemoteMoviesDataSource
{
  Future<List<modelMovies>>getNowPlayingMovies();
  Future<List<modelMovies>>getPopularMovies();
  Future<List<modelMovies>>getTopRatedMovies();
  Future<MoviesDetailModel>getMovieDetail(MovieDetailParameter movieDetailParameter);
  Future<List<RecommendationModel>>getRecommendationMovies(MoviesRecommendationParameter moviesRecommendationParameter);
}
class remoteMoveisDataSource implements baseRemoteMoviesDataSource
{
  Future<List<modelMovies>>getNowPlayingMovies()async
  {
    var  response=await Dio().get('${AppConstances.nowPlaying}');
    if(response.statusCode==200)
      {
        return List<modelMovies>.from((response.data['results'] as List).map((e) =>modelMovies.fromJason(e)));
      }
    else
      {
        throw ServerExceptionModel(model: errorModel.fromJason(response.data));
      }
  }

  @override
  Future<List<modelMovies>> getPopularMovies() async
  {
    var response=await Dio().get(AppConstances.popularMovies);
    if(response.statusCode==200)
      {
        return List<modelMovies>.from((response.data['results'] as List).map((e) => modelMovies.fromJason(e)));
      }
    else
      {
        throw ServerExceptionModel(model: errorModel.fromJason(response.data));
      }
  }

  @override
  Future<List<modelMovies>> getTopRatedMovies()async
  {
    var response=await Dio().get(AppConstances.topRatedMovies);
    if(response.statusCode==200)
      {
        return List<modelMovies>.from((response.data['results'] as List).map((e) => modelMovies.fromJason(e)));
      }
    else
      {
        throw ServerExceptionModel(model: errorModel.fromJason(response.data));
      }
  }

  @override
  Future<MoviesDetailModel> getMovieDetail(MovieDetailParameter movieDetailParameter) async {
    var response=await Dio().get(AppConstances.DetailPath(movieDetailParameter.movieId ));
    if(response.statusCode==200)
    {
      return  MoviesDetailModel.fromJason(response.data);
    }
    else
    {
      throw ServerExceptionModel(model: errorModel.fromJason(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendationMovies(MoviesRecommendationParameter moviesRecommendationParameter)async  {
    var response=await Dio().get(AppConstances.recommendationPath(moviesRecommendationParameter.movieId));
    if(response.statusCode==200)
    {
      return List<RecommendationModel>.from((response.data['results'] as List).map((e) => RecommendationModel.fromJason(e)));
    }
    else
    {
      throw ServerExceptionModel(model: errorModel.fromJason(response.data));
    }
  }
}