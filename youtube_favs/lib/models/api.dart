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

    String _search;
    String _nextToken;
    

    Future<List<Video>> search(String search) async {
        
        Dio dio = new Dio();
        Response response;
        _search = search;

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

        return _decodeSearch(response);

    }

    List<Video> _decodeSearch(Response response) {

        if( response.statusCode == 200 )
        {

            Map<String, dynamic> json = new Map<String, dynamic>
                    .from(response.data);

            _nextToken = json["nextPageToken"];

            List<Video> videos = json["items"].map<Video>( (v) {
                return Video.fromJson(v);
            }).toList();

            return videos;

        } else {
            throw Exception("Failed to load videos!");
        }

    }

    Future<List<Video>> nextPage() async {
        
        Dio dio = new Dio();
        Response response;

        try { 

            response = await dio.get("https://www.googleapis.com/youtube/v3/"
                          "search?part=snippet&q=$_search&type=video"
                          "&key=$API_KEY&maxResults=10&pageToken=$_nextToken");

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
        
        return _decodeSearch(response);

    }

}


