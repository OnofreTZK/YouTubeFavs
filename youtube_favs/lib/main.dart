import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

// Screens
import './screens/home.dart';

// Blocs
import './blocs/video_bloc.dart';
import './blocs/favorite_bloc.dart';

void main() => runApp(YouTubeFavsApp());

class YouTubeFavsApp extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return BlocProvider(
            blocs: [
                Bloc((i) => VideosBloc()),
                Bloc((i) => FavoriteBloc()),
            ],
            child: MaterialApp(
                title: 'YouTube Favorites',
                home: HomePage(),
            ), // MaterialApp
        ); // BlocProvider
    }

}
