import 'package:movies_app/Movies/domain/entities/movies.dart';

class modelMovies extends Movies
{
  modelMovies({
    required super.id,
    required super.title,
    required super.backdopPath,
    required super.gnderIds,
    required super.overveiw,
    required super.voitAvg,
    required super.releaseDate});

  factory modelMovies.fromJason(Map<String,dynamic>jason)
  {
    return modelMovies(
        id: jason['id'],
        title: jason['title'],
        backdopPath: jason['backdrop_path'],
        gnderIds:List<int>.from(jason['genre_ids'].map((e)=>e)),
        overveiw: jason['overview'],
        voitAvg: jason['vote_average'].toDouble(),
        releaseDate: jason['release_date']);
  }

}