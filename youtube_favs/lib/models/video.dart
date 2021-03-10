
class Video {
    
    // Video main attributes
    final String id;
    final String title;
    final String thumb;
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
            id: json["videoId"],
            title: json["snippet"]["title"],
            thumb: json["snippet"]["thumbnails"]["high"],
            channel: json["snippet"]["channelTitle"],
        );

    }

}
