import 'package:flutter/material.dart';

// Http client
import 'package:dio/dio.dart';

// Json convert
import 'dart:convert';

class DataSearch extends SearchDelegate<String> {

 
    @override
    List<Widget> buildActions(BuildContext context) { 
        return [
            IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                    query = "";
                },
            ), //IconButton
        ];
    }


    @override
    Widget buildLeading(BuildContext context) {
        return IconButton(
            icon: AnimatedIcon(
                icon: AnimatedIcons.menu_arrow,
                progress: transitionAnimation,
            ), // AnimatedIcon
            onPressed: (){
                close(context, null);
            },
        ); // IconButton
    }


    @override
    Widget buildResults(BuildContext context) {
        
        Future.delayed(Duration.zero).then((_) => close(context, query));

        return Container();
    }


    @override
    Widget buildSuggestions(BuildContext context) {
        if(query.isEmpty)
            return Container(); // Shows nothing.
        else
            return FutureBuilder<List>(
                future: _suggestions(query),
                builder: (context, snapshot) {
                    if(!snapshot.hasData) {
                        return Center(
                            child: CircularProgressIndicator(),
                        ); // Center
                    } else {
                        return ListView.builder(
                                itemBuilder: (context, index) {
                                    return ListTile(
                                        title: Text(snapshot.data[index]),
                                        leading: Icon(Icons.play_arrow),
                                        onTap: () async {
                                            close(context, snapshot.data[index]);
                                        },
                                    ); // ListTile
                                },
                                itemCount: snapshot.data.length,
                        ); // ListView.builder
                    } 
                }, // builder
            ); // FutureBuilder
    }



    // GET request for suggestions
    Future<List> _suggestions(String search) async {

        Dio dio = new Dio();
        Response response;
        
        try {
            response = await dio.get("http://suggestqueries.google.com"
                                              "/complete/search?hl=en&ds=yt"
                                              "&client=youtube&hjson=t&cp=1"
                                              "&q=${search}&format=5&alt=json");

            if( response.statusCode == 200 ) {
                
                List<dynamic> json = new List<dynamic>
                        .from(response.data);


                var suggestList = json[1].map((s) {
                    return s[0];
                }).toList();

                return suggestList;
            } else {
                throw Exception("Failed to load suggestions!");
            }
       

        } on DioError catch(err) {
            if( err.response != null )
            {
                print(err.response.data);
                print(err.response.headers);
                print(err.response.request);
            } else {
                print(err.request);
                print(err.message);
            }
        }




    }

}
