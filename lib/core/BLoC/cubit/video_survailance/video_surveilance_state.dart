part of 'video_surveilance_cubit.dart';

abstract class VideoSurveilanceState extends Equatable {
  const VideoSurveilanceState();

  @override
  List<Object> get props => [];
}

class VideoSurveilanceInitial extends VideoSurveilanceState {}

class VideoSurveilanceView extends VideoSurveilanceState {
  VideoPlayerController? videoController;
  late bool? isPlaying;
  late List<String> videoPaths;
  late int indexPlayingVideo;

  void initVideoController() {
    indexPlayingVideo = 0;
    videoPaths = [
      "assets/video/video_surveillance.mp4",
      "assets/video/video_surveillance_1.mp4",
    ];
    videoController = VideoPlayerController.asset(videoPaths[indexPlayingVideo])
      ..initialize();
    videoController!.setLooping(true);
    videoController!.setVolume(0);
    isPlaying = true;
  }

  VideoSurveilanceView({this.videoController, this.isPlaying});

  void playVideo() {
    videoController!.play();
  }

  void dispose() {
    videoController!.dispose();
  }

  void backOnPressed(BuildContext context) async {
    await videoController!.seekTo(Duration.zero);
    videoController!.pause();

    Navigator.of(context).pop();
  }
}
