import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Movies/presintaion/controller/movies_bloc.dart';
import 'package:movies_app/Movies/presintaion/controller/movies_state.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utils/app_constances.dart';
import '../../../core/utils/dummy (1).dart';

class TopRatedComponent extends StatelessWidget
{
  const TopRatedComponent({super.key});

  @override
  Widget build(BuildContext context) {

    return  BlocBuilder<MoviesBloc,MoviesState>(
      buildWhen: (previous,current)=>
      previous.TopRatedMoviesRequistState != current.TopRatedMoviesRequistState,
      builder: (context,state){
        switch(state.TopRatedMoviesRequistState)
        {
          case RequestState.Loading :
            return Container(
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            );
          case RequestState.Loaded:
            return FadeIn(
        duration: const Duration(milliseconds: 500),
        child: SizedBox(
           height: 170.0,
        child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: state.TopRadeMovies.length,
        itemBuilder: (context, index) {
        final movie = state.TopRadeMovies[index];
        return Container(
        padding: const EdgeInsets.only(right: 8.0),
        child: InkWell(
        onTap: () {
        /// TODO : NAVIGATE TO  MOVIE DETAILS
        },
        child: ClipRRect(
        borderRadius:
        const BorderRadius.all(Radius.circular(8.0)),
        child: CachedNetworkImage(
        width: 120.0,
        fit: BoxFit.cover,
        imageUrl: AppConstances.imageURL(image: movie.backdopPath),
        placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[850]!,
        highlightColor: Colors.grey[800]!,
        child: Container(
        height: 170.0,
        width: 120.0,
        decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8.0),
        ),
        ),
        ),
        errorWidget: (context, url, error) =>
        const Icon(Icons.error),
        ),
        ),
        ),
        );
        },
        ),
        ),
        );
            // TODO: Handle this case.
          case RequestState.error:
            return Container(
              child:  Center(
                child: Text(state.TopRatdeMessage),
              ),
            );
            // TODO: Handle this case.
        }
      },

    );
  }

}