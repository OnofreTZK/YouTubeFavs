import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

// Video Class
import '../models/video.dart';

// FavoriteBloc
import '../blocs/favorite_bloc.dart';

// Flutter Youtube
import 'package:flutter_youtube/flutter_youtube.dart';

// API KEY
import '../api_data/api_key.dart';

class VideoTile extends StatelessWidget {

    final Video video;

    VideoTile(this.video);

    @override
    Widget build(BuildContext context) {

        final _favBloc = BlocProvider.getBloc<FavoriteBloc>();

        return GestureDetector(
            onTap: () {
                FlutterYoutube.playYoutubeVideoById(
                    apiKey: API_KEY,
                    videoId: video.id,
                );
            },
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 4),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                        AspectRatio(
                            aspectRatio: 16.0/9.0,
                            child: Image.network(video.thumb['url'], fit: BoxFit.cover,),
                        ), // AspectRatio
                        Row(
                            children: <Widget>[
                                Expanded(
                                    child: Column(
                                        crossAxisAlignment: 
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                            Padding(
                                                padding: EdgeInsets
                                                    .fromLTRB(8, 8, 8, 0),
                                                child: Text( 
                                                    video.title,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                    ), // TextStyle
                                                    maxLines: 2,
                                                ), // Text
                                            ), // Padding
                                            Padding(
                                                padding: EdgeInsets
                                                    .fromLTRB(8, 8, 8, 0),
                                                child: Text( 
                                                    video.channel,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                    ), // TextStyle
                                                ), // Text
                                            ), // Padding
                                        ], //<Widget>
                                    ), // Column
                                ), // Expanded
                                StreamBuilder<Map<String, Video>>(
                                    stream: _favBloc.outFav,
                                    builder: (context, snapshot) {
                                        if(snapshot.hasData) {
                                            return IconButton(
                                                icon: Icon(snapshot.data
                                                        .containsKey(video.id) 
                                                        ? Icons.star 
                                                        : Icons.star_border
                                                ), // Icon
                                                color: Colors.white,
                                                iconSize: 38,
                                                onPressed: () {
                                                    _favBloc.toggleFavorite(video);
                                                }
                                            );
                                        } else {
                                            return Container();
                                        }
                                    }
                                ), // StreamBuilder
                            ], // <Widget>
                        ), // Row
                    ], // <Widget>
                ), // Column
            ), // Container
        ); // GestureDetector
    }

}
                            
