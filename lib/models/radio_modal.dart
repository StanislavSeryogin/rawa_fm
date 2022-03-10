class RadioModal {
  final String artist;
  final String title;
  final String art;
  final String playlist;

  RadioModal({
    required this.artist,
    required this.title,
    required this.art,
    required this.playlist,
  });

  factory RadioModal.fromJson(Map<String, dynamic> json) {
    return RadioModal(
      artist: json['now_playing']['song']['artist'],
      title: json['now_playing']['song']['title'],
      art: json['now_playing']['song']['art'],
      playlist: json['now_playing']['playlist'],
    );
  }
}
