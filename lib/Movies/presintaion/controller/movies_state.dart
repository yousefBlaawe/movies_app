import 'package:equatable/equatable.dart';
import 'package:movies_app/Movies/domain/entities/movies.dart';
import 'package:movies_app/core/utils/enums.dart';

class MoviesState extends Equatable
{
  final List<Movies> NowPlayingMovies;
  final String nowPlayingmessage;
  final RequestState NowPlayingrequestState ;
  final List<Movies> PopularMoives;
  final String PopularMoviesMessage;
  final RequestState PopularMoviesRequasetState ;
  final List<Movies> TopRadeMovies;
  final String TopRatdeMessage;
  final RequestState TopRatedMoviesRequistState ;
  MoviesState({
    this.NowPlayingrequestState = RequestState.Loading,
    this.nowPlayingmessage ='',
    this.NowPlayingMovies=const [],
    this.PopularMoives=const[],
    this.PopularMoviesMessage='',
    this.PopularMoviesRequasetState=RequestState.Loading,
    this.TopRadeMovies=const[],
    this.TopRatdeMessage='',
    this.TopRatedMoviesRequistState=RequestState.Loading,
} );

  MoviesState cobyWith({
     List<Movies>? NowPlayingMovies,
     String ?nowPlayingmessage,
     RequestState? NowPlayingrequestState ,
     List<Movies>? PopularMoives,
     String? PopularMoviesMessage,
     RequestState? PopularMoviesRequasetState ,
     List<Movies>? TopRadeMovies,
     String? TopRatdeMessage,
     RequestState? TopRatedMoviesRequistState ,
})
  {
    return MoviesState(
      NowPlayingMovies: NowPlayingMovies ?? this.NowPlayingMovies ,
      NowPlayingrequestState:NowPlayingrequestState ?? this.NowPlayingrequestState,
      nowPlayingmessage: nowPlayingmessage ?? this.nowPlayingmessage,
      PopularMoives: PopularMoives ??this.PopularMoives,
      PopularMoviesMessage: PopularMoviesMessage ?? this.PopularMoviesMessage,
      PopularMoviesRequasetState: PopularMoviesRequasetState ??this.PopularMoviesRequasetState,
      TopRatedMoviesRequistState: TopRatedMoviesRequistState ?? this.TopRatedMoviesRequistState,
      TopRadeMovies: TopRadeMovies ?? this.TopRadeMovies,
      TopRatdeMessage: TopRatdeMessage ?? this.TopRatdeMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    NowPlayingMovies,
    NowPlayingrequestState,
    nowPlayingmessage,
    PopularMoviesMessage,
    PopularMoviesRequasetState,
    PopularMoives,
    TopRatedMoviesRequistState,
    TopRatdeMessage,
    TopRadeMovies,
  ];
}
// في مشكله انه كل ما اعمل emit state اراح يعكل new object ويخزن فيه الاتا ويمحي الداتا القدسمه عشان يزبط بتعمل اشي اسمه copy with
// هاي بتعمل object واحد وبكل مره بتعمل فيها emit بخزن الداتا القديمه على نفس ال object
// NowPlayingMovies: NowPlayingMovies ?? this.NowPlayingMovies ,
//NowPlayingMovies ?? اذا كانت null اعمل save  للقيمه الجاي
// اذا ماكانت null اعمل save للقيمه الحليه وخزن قيمه جديده