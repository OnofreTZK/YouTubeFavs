// flutter_bloc
import 'package:flutter_bloc/flutter_bloc.dart';

// api
import '../models/api.dart';

// Video class
import '../models/video.dart';

// Asynchronous
import 'dart:async';

class VideosBloc {

    Api api;

    List<Video> videos;
   
    final StreamController _videosController = StreamController();

    final StreamController _searchController = StreamController();

    // Getters
    Stream get outVideos => _videosController.stream;

    Sink get inSearch => _searchController.sink;

    // Constructor
    VideosBloc(){
        api = Api();

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
