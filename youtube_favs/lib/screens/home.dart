import 'package:flutter/material.dart';
import '../delegates/data_search.dart';

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
                        onPressed: () {
                            showSearch(context: context, 
                                       delegate: DataSearch());
                        },
                    ), // IconButton
                ], // <Widget>
            ), // AppBar
            body: Container(),
        ); // Scaffold
    }
}
