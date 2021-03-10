import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// searchDelegate
import '../delegates/data_search.dart';

// VideosBloc
import '../blocs/video_bloc.dart';

class HomePage extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Container(
                    height: 25,
                    child: Image.asset("assets/images/yt_logo_real.png"),
                ), // Container
                elevation: 0,
                backgroundColor: Colors.black87,
                actions: <Widget>[
                    Align( 
                        alignment: Alignment.center,
                        child: Text("0"),
                    ), // Align
                    IconButton(
                        icon: Icon(Icons.star),
                        onPressed: () {},
                    ), // IconButton
                    IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () async {
                            String result = showSearch(context: context, 
                                       delegate: DataSearch()) as String ;
                            if(result != null) {
                                BlocProvider.of<VideosBloc>
                                (context).inSearch.add(result);
                            }
                        },
                    ), // IconButton
                ], // <Widget>
            ), // AppBar
            body: Container(),
        ); // Scaffold
    }
}
