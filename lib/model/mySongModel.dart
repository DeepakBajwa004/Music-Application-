class MySongModel {
  int? id;
  String? title;
  String? artist;
  String? album;
  String? albumArt;
  String? data;

  MySongModel(
      {this.id, this.title, this.artist, this.album, this.albumArt, this.data});

  MySongModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    artist = json['artist'];
    album = json['album'];
    albumArt = json['albumArt'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['artist'] = this.artist;
    data['album'] = this.album;
    data['albumArt'] = this.albumArt;
    data['data'] = this.data;
    return data;
  }
}


