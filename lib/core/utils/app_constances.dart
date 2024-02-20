class AppConstances
{
  static const String baseUrl='https://api.themoviedb.org/3';
  static const String apiKey='45ee05e69706e88eb0e1dfe5c8f49b31';

  static const String nowPlaying='$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String popularMovies='$baseUrl/movie/popular?api_key=$apiKey';
  static const String topRatedMovies='$baseUrl/movie/top_rated?api_key=$apiKey';
  static const String baseImageURL='https://image.tmdb.org/t/p/original';
  static String imageURL({required String image})
  {
    return '${baseImageURL}$image';
  }
  static String DetailPath(int movieId)
  {
    return '$baseUrl/movie/$movieId?api_key=$apiKey';
  }

  static String recommendationPath(int movieId)
  {
    return '$baseUrl/movie/$movieId/recommendations?api_key=$apiKey';
  }

//https://image.tmdb.org/t/p/original/jXJxMcVoEuXzym3vFnjqDW4ifo6.jpg

}