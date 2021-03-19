import 'package:bloc_pattern/bloc_pattern.dart';

// Video
import '../models/video.dart';

// Asynchronous
import 'dart:async';

// Shared Preferences to permantly save data.
import 'package:shared_preferences/shared_preferences.dart';

// JsonEncode
import 'dart:convert';

// The boss: rxdart
import 'package:rxdart/rxdart.dart';


class FavoriteBloc extends BlocBase {

    Map<String, Video> _favorites = {};

    final _favController = BehaviorSubject<Map<String, Video>>
            .seeded({});
    
    Stream<Map<String, Video>> get outFav => _favController.stream;

    
    FavoriteBloc() {
        SharedPreferences.getInstance().then((prefs) { 
            if(prefs.getKeys().contains("favorites")) {

                _favorites = jsonDecode(prefs.getString("favorites"))
                    .map((key, value) {
                    return MapEntry(key, Video.fromJson(value));
                }).cast<String, Video>();

                _favController.sink.add(_favorites);
            }
        });        
    }


    void toggleFavorite(Video video) {
        if(_favorites.containsKey(video.id)) {
            _favorites.remove(video.id);
        } else {
            _favorites[video.id] = video;
        }

        _favController.sink.add(_favorites);

        _saveFav();

    }

    
    void _saveFav(){
        SharedPreferences.getInstance().then((prefs) {
            prefs.setString("favorites", jsonEncode(_favorites));
        });
    }

    @override
    void dispose() {
        
        super.dispose();
        _favController.close();
    }
}
