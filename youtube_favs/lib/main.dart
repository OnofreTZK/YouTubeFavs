import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Screens
import './screens/home.dart';

// VideosBloc
import './blocs/video_bloc.dart';

void main() => runApp(YouTubeFavsApp());

class YouTubeFavsApp extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return BlocProvider(
            create: (BuildContext context) => VideosBloc(),
            child: MaterialApp(
                title: 'YouTube Favorites',
                home: HomePage(),
            ), // MaterialApp
        ); // BlocProvider
    }

}
