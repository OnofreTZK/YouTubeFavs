import 'package:bloc_pattern/bloc_pattern.dart';

// Video
import '../models/video.dart';

// Asynchronous
import 'dart:async';


class FavoriteBloc extends BlocBase {

    Map<String, Video> _favorites = {};

    final StreamController<Map<String, Video>> _favController = 
            StreamController<Map<String, Video>>.broadcast();
    
    Stream<Map<String, Video>> get outFav => _favController.stream;


    void toggleFavorite(Video video) {
        if(_favorites.containsKey(video.id)) {
            _favorites.remove(video.id);
        } else {
            _favorites[video.id] = video;
        }

        _favController.sink.add(_favorites);

    }

    @override
    void dispose() {

    }
}
