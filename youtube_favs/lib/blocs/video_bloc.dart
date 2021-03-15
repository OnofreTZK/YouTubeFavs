// bloc
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

// api
import '../models/api.dart';

// Video class
import '../models/video.dart';

// Asynchronous
import 'dart:async';

class VideosBloc extends BlocBase {

    Api api;

    List<Video> videos;
   
    final StreamController<List<Video>> _videosController =  
            new StreamController<List<Video>>();

    final StreamController<String> _searchController = 
            new StreamController<String>();

    // Getters
    Stream get outVideos => _videosController.stream;

    Sink get inSearch => _searchController.sink;

    // Constructor
    VideosBloc(){
        api = new Api();

        _searchController.stream.listen(_search);
    }

    // Methods
    void _search(String search) async {
        
        videos = await api.search(search);
    }

    // Destructor
    @override
    void dispose() {
        _videosController.close();
        _searchController.close();
    }
}
