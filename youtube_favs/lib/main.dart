import 'package:flutter/material.dart';

// Screens
import './screens/home.dart';

void main() => runApp(YouTubeFavsApp());

class YouTubeFavsApp extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'YouTube Favorites',
            home: HomePage(),
        ); // MaterialApp
    }

}
