import 'package:get_it/get_it.dart';
import 'package:movies_app/Movies/data/datasource/remote_movies_data_source.dart';
import 'package:movies_app/Movies/domain/repository/base_repository_movies.dart';
import 'package:movies_app/Movies/domain/usecase/get_Top_rated_movies_usecase.dart';
import 'package:movies_app/Movies/domain/usecase/get_movie_detail_use_case.dart';
import 'package:movies_app/Movies/domain/usecase/get_movies_recommendation_use_case.dart';
import 'package:movies_app/Movies/domain/usecase/get_now_palying_movis_usecase.dart';
import 'package:movies_app/Movies/domain/usecase/get_popular_movies_usecase.dart';

import '../../Movies/data/repository/movies_repository.dart';
import '../../Movies/presintaion/controller/movie_detail_bloc.dart';
import '../../Movies/presintaion/controller/movies_bloc.dart';
final SL = GetIt.instance;

class ServiceLocator
{
  void init()
  {
    //Bloc
    SL.registerFactory(() => MoviesBloc(SL(),SL(),SL()));
    SL.registerFactory(() => MovieDetailBloc(SL(),SL()));
    // UseCases
    SL.registerLazySingleton(() => getNowPlayingMoviesUseCase(SL()));
    SL.registerLazySingleton(() => getPopularMoviesUseCase(SL()));
    SL.registerLazySingleton(() => getTopRatedMoviesUseCase(SL()));
    SL.registerLazySingleton(() => GetMoviesDetailUseCase(SL()));
    SL.registerLazySingleton(() => GetMoviesRecommendationUseCase(SL()));
    ///Repository
    SL.registerLazySingleton<baseRepositoryMoives>(() => MoviesRepository(SL()));
    ///DataSource
    SL.registerLazySingleton<baseRemoteMoviesDataSource>(() => remoteMoveisDataSource());
  }
}
//registerLazySingleton: لا تعمل create لل object الا بس تستدعيه
// SL.registerLazySingleton<baseRemoteMoviesDataSource> بحدد وين موجود بالزبط
// (() => remoteMoveisDataSource());
//SL.registerLazySingleton<baseRepositoryMoives>(() => MoviesRepository(SL()));
//MoviesRepository(SL()) بحكيله انه انا اصلا عامل OBJECT منه روح دور عليه 