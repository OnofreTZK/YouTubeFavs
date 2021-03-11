// Api key
import '../api_data/api_key.dart';

// Asynchronous
import 'dart:async';

// http client
import 'package:dio/dio.dart';

// Json convert
import 'dart:convert';

// Video obj
import './video.dart';

class Api {
    
    search(String search) async {
        
        Dio dio = new Dio();
        Response response;

        try { 
            print("SEARCH:${search}");

            response = await dio.get("https://www.googleapis.com/youtube/v3/"
                                     "search?part=snippet&q=${search}"
                                     "&type=video&key=${API_KEY}&maxResults=10");
        } on DioError catch(err) {
            if(err.response != null)
            {
                print(err.response.data);
                print(err.response.headers);
                print(err.response.request);
            } else {
                print(err.request);
                print(err.message);
            }
        }

        return this._decodeSearch(response);

    }

    List<Video> _decodeSearch(Response response) {

        if( response.statusCode == 200 )
        {
            print(response.data);

            Map<String, dynamic> json = new Map<String, dynamic>
                    .from(response.data);

            print("TEST");

            List<Video> videos = json["items"].map<Video>( (v) {
                return Video.fromJson(v);
            }).toList();

            print(videos);
            return videos;

        } else {
            throw Exception("Failed to load videos!");
        }

    }

}


