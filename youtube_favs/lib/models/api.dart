// Api key
import '../api_data/api_key.dart';

// Asynchronous
import 'dart:async';

// http client
import 'dart:dio';


class Api {
    
    search(String search) async {
        
        Dio dio = new Dio();
        Response response;

        try { 

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

        if( response.statusCode == 200 )
        {
            print(response.data);
        }


    }

}


