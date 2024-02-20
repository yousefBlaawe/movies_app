import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Movies/data/datasource/remote_movies_data_source.dart';
import 'package:movies_app/Movies/data/repository/movies_repository.dart';
import 'package:movies_app/Movies/domain/repository/base_repository_movies.dart';
import 'package:movies_app/Movies/presintaion/controller/movies_event.dart';
import 'package:movies_app/Movies/presintaion/controller/movies_state.dart';
import 'package:movies_app/core/base_usecase/base_usecase.dart';
import 'package:movies_app/core/servecies/serveices_locator.dart';
import 'package:movies_app/core/utils/enums.dart';

import '../../domain/usecase/get_Top_rated_movies_usecase.dart';
import '../../domain/usecase/get_now_palying_movis_usecase.dart';
import '../../domain/usecase/get_popular_movies_usecase.dart';

class MoviesBloc extends Bloc<MoviesEvent,MoviesState>
{
  final getNowPlayingMoviesUseCase nowPlayingMoviesUseCase;
  final getPopularMoviesUseCase popularMoviesUseCase;
  final getTopRatedMoviesUseCase topRatedMoviesUseCase;

  MoviesBloc(this.nowPlayingMoviesUseCase,this.popularMoviesUseCase,this.topRatedMoviesUseCase):super(MoviesState())
  {
    on<GetNowPlayingMovies>(_getNowPlaying);
    print('nowPlaying++++++');
    on<GetPopularMovies>(_getPopular);
    on<GetTopRatedMovies>(_getTopRated);
    print('topRated_________');

  }

  FutureOr<void>_getNowPlaying( GetNowPlayingMovies event, Emitter<MoviesState> emit) async {
    final result = await nowPlayingMoviesUseCase(NoParameters());
    //emit(MoviesState(NowPlayingrequestState: RequestState.Loaded));
    result.fold(
            (l) => emit(state.cobyWith(NowPlayingrequestState: RequestState.error,nowPlayingmessage: l.message)),
            (r) => emit(state.cobyWith(NowPlayingrequestState: RequestState.Loaded,NowPlayingMovies: r)));
  }
  FutureOr<void>_getPopular(GetPopularMovies event,Emitter<MoviesState> emit)async {
    final result=await popularMoviesUseCase(NoParameters());
    // emit(MoviesState(PopularMoviesRequasetState: RequestState.Loading,));
    result.fold(
            (l) => emit(state.cobyWith(PopularMoviesRequasetState: RequestState.error,PopularMoviesMessage: l.message)),
            (r) => emit(state.cobyWith(PopularMoviesRequasetState: RequestState.Loaded,PopularMoives: r)));
  }
  FutureOr<void>_getTopRated( GetTopRatedMovies event, Emitter<MoviesState> emit)async {
    final result=await topRatedMoviesUseCase(NoParameters());
    // emit(MoviesState(TopRatedMoviesRequistState: RequestState.Loading,));
    result.fold(
            (l) => emit(state.cobyWith(TopRatedMoviesRequistState: RequestState.error,TopRatdeMessage: l.message)),
            (r) => emit(state.cobyWith(TopRatedMoviesRequistState: RequestState.Loaded,TopRadeMovies: r)));
  }

}
//on<GetNowPlayingMovies>((event, emit)async
//on to add events to the bloc
// عشان اوحد اسم ال method تبعت ال  usecase
// بسميهم كلهم اسم call
// اول ما اسميها بتصير لحاله اول ما انادي على ال object ينادي هاي ال method
