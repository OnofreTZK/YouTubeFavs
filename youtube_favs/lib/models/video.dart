
class Video {
    
    // Video main attributes
    final String id;
    final String title;
    final dynamic thumb;
    final String channel;

    // Constructor
    Video({
        this.id,
        this.title,
        this.thumb,
        this.channel,
    });

    factory Video.fromJson(Map<String, dynamic> json){
        
        return Video(
            id: json["id"]["videoId"] as String,
            title: json["snippet"]["title"] as String,
            thumb: json["snippet"]["thumbnails"]["high"] as dynamic,
            channel: json["snippet"]["channelTitle"] as String,
        );

    }

}
