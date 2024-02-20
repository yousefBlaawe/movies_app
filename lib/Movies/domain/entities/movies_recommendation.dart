import 'package:equatable/equatable.dart';

class MoviesRecommendation extends Equatable
{
  final String? backdropPath;
  final int id;
 const  MoviesRecommendation({
    required this.backdropPath,
   required this.id,
});
  @override
  // TODO: implement props
  List<Object?> get props =>[backdropPath,id] ;

}