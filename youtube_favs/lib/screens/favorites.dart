import 'package:flutter/material.dart';

// bloc provider
import 'package:bloc_pattern/bloc_pattern.dart';
import '../blocs/favorite_bloc.dart';

// Video
import '../models/video.dart';

// VideoTile
import '../components/video_tile.dart';

// Flutter Youtube
import 'package:flutter_youtube/flutter_youtube.dart';

// API KEY
import '../api_data/api_key.dart';

class FavoritesPage extends StatelessWidget {
    
    @override
    Widget build(BuildContext context) {

        final _favBloc = BlocProvider.getBloc<FavoriteBloc>();

        return Scaffold(
            appBar: AppBar(
                title: Text("Favoritos"),
                centerTitle: true,
                backgroundColor: Colors.black87,
            ), // AppBar
            backgroundColor: Colors.black87,
            body: StreamBuilder<Map<String, Video>>(
                stream: _favBloc.outFav,
                initialData: {},
                builder: (context, snapshot) {
                    return ListView(
                        children: snapshot.data.values.map((v) {
                            return InkWell(
                                onTap: () {
                                    FlutterYoutube.playYoutubeVideoById(
                                        apiKey: API_KEY,
                                        videoId: v.id,
                                    );
                                },
                                child: VideoTile(v),
                            ); // InkWell
                        }).toList(),
                    ); // ListView
                }
            ), // StreamBuilder
        );// Scaffold
      
    }

    
}
