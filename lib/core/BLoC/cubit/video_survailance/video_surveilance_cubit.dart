import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

part 'video_surveilance_state.dart';

class VideoSurveilanceCubit extends Cubit<VideoSurveilanceState> {
  VideoSurveilanceCubit(VideoSurveilanceView initialState)
      : super(initialState);
}
