
class Topics {

  List<TopicResponse> items = new List();

  Topics();

  Topics.fromJsonList( List<dynamic> jsonList ) {
    if ( jsonList == null ) return;

    for (var item in jsonList) {
      final topic = new TopicResponse.fromJsonMap(item);
      items.add(topic);
    }
  }

}

class TopicResponse {
  int id;
  String tema;

  TopicResponse({
    this.id,
    this.tema,
  });

  TopicResponse.fromJsonMap( Map<String, dynamic> json ) {
    id = json['id'];
    tema = json['tema'];
  }

}
