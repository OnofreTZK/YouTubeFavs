import 'package:flutter/material.dart';

// Video Class
import '../models/video.dart';

class VideoTile extends StatelessWidget {

    final Video video;

    VideoTile(this.video);

    @override
    Widget build(BuildContext context) {
        return Container(
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        ], // <Widget>
                    ), // Row
                ], // <Widget>
            ), // Column
        ); // Container
    }

}
                            
