import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/Movies/domain/entities/movies.dart';
import 'package:movies_app/Movies/domain/usecase/get_now_palying_movis_usecase.dart';
import 'package:movies_app/Movies/presintaion/componenet/popular_component.dart';
import 'package:movies_app/Movies/presintaion/componenet/top_rated_component.dart';
import 'package:movies_app/Movies/presintaion/controller/movies_bloc.dart';
import 'package:movies_app/Movies/presintaion/controller/movies_event.dart';
import 'package:movies_app/core/servecies/serveices_locator.dart';
import 'package:movies_app/core/utils/app_string.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utils/app_constances.dart';
import '../../../core/utils/dummy (1).dart';
import '../componenet/mow_palying_componanet.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>SL<MoviesBloc>()..add(GetNowPlayingMovies())..add(GetPopularMovies())..add(GetTopRatedMovies()),
      child: Scaffold(
        backgroundColor:  Colors.black.withOpacity(0.9),
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const  NowPlayingComponent(),
              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${AppString.popular}",
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                        color: Colors.white
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO POPULAR SCREEN
                      },
                      child:  Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                           Text("${AppString.seeMore}",style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.w900),),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const PopularComponent(),
              Container(
                margin: const EdgeInsets.fromLTRB(
                  16.0,
                  24.0,
                  16.0,
                  8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${AppString.topRated}",
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                        color: Colors.white
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO Top Rated Movies Screen
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children:  [
                            Text('${AppString.seeMore}',
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const TopRatedComponent(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
// اي اشي بنعمله rebuild بفصله ب component لحاله
