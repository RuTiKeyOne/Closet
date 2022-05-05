import 'package:closet/core/BLoC/cubit/video_survailance/video_surveilance_cubit.dart'
    as videoCubit;
import 'package:closet/presentation/video_surveillance/video_surveilance_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class VideoSurveilanceScreen extends StatelessWidget {
  const VideoSurveilanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<videoCubit.VideoSurveilanceCubit,
        videoCubit.VideoSurveilanceState>(
      builder: (context, state) {
        if (state is videoCubit.VideoSurveilanceView) {
          return VideoSurveilanceView(
            state: state,
          );
        }
        return Container();
      },
    );
  }
}
