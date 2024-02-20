import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Movies/domain/usecase/get_movie_detail_use_case.dart';
import 'package:movies_app/Movies/presintaion/controller/movie_datail_event.dart';
import 'package:movies_app/Movies/presintaion/controller/movie_detail_state.dart';
import 'package:movies_app/core/utils/enums.dart';

import '../../domain/usecase/get_movies_recommendation_use_case.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent,MovieDetailState>
{
  final GetMoviesDetailUseCase getMoviesDetailUseCase ;
  final GetMoviesRecommendationUseCase getMoviesRecommendationUseCase;
  MovieDetailBloc(this.getMoviesDetailUseCase,this.getMoviesRecommendationUseCase):super(const MovieDetailState()){
    on<GetMovieDetailEvent>(_getMovieDetail);
    on<GetMovieRecommendationEvent>(_getMoviesRecommendation);
  }

  FutureOr<void>_getMovieDetail(GetMovieDetailEvent event,Emitter<MovieDetailState> emit)async
  {
    final result=await  getMoviesDetailUseCase(MovieDetailParameter(movieId: event.id));
    result.fold(
            (l) =>emit(state.copyWith(movieDetailRequestState: RequestState.error,movieDetailMessage: l.message)) ,
            (r) => emit(state.copyWith(movieDetailRequestState: RequestState.Loaded,moviesDetail: r)));
  }

  FutureOr<void>_getMoviesRecommendation(GetMovieRecommendationEvent event,Emitter<MovieDetailState>emit)async
  {
    final result=await getMoviesRecommendationUseCase(MoviesRecommendationParameter(movieId: event.id));
    result.fold(
            (l) => emit(state.copyWith(recommendationRequestState: RequestState.error,recommendationMessage: l.message)),
            (r) => emit(state.copyWith(recommendationRequestState: RequestState.Loaded,moviesRecommendation: r)));
  }
}