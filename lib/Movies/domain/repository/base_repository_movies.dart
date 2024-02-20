import 'package:dartz/dartz.dart';
import 'package:movies_app/Movies/domain/entities/movies.dart';
import 'package:movies_app/Movies/domain/entities/movies_detail.dart';
import 'package:movies_app/Movies/domain/entities/movies_recommendation.dart';
import 'package:movies_app/Movies/domain/usecase/get_movie_detail_use_case.dart';
import 'package:movies_app/Movies/domain/usecase/get_movies_recommendation_use_case.dart';

import '../../../core/exception_error/failuer.dart';

abstract class baseRepositoryMoives
{
  Future<Either<Failure,List<Movies>>>getNowPlaying();
  Future<Either<Failure,List<Movies>>>getPopular();
  Future<Either<Failure,List<Movies>>>getTopRated();
  Future<Either<Failure , MoviesDetail>>getMovieDetail(MovieDetailParameter movieDetailParameter );
  Future<Either<Failure,List<MoviesRecommendation>>>getMoviesRecommendation (MoviesRecommendationParameter moviesRecommendationParameter);
}