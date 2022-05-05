import 'package:closet/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';
import 'package:closet/core/BLoC/cubit/video_survailance/video_surveilance_cubit.dart'
    as videoCubit;
import 'package:video_player/video_player.dart';

class VideoSurveilanceView extends StatefulWidget {
  final videoCubit.VideoSurveilanceView state;
  const VideoSurveilanceView({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  State<VideoSurveilanceView> createState() => _VideoSurveilanceViewState();
}

class _VideoSurveilanceViewState extends State<VideoSurveilanceView> {
  @override
  void initState() {
    widget.state.playVideo();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.state.backOnPressed(context);
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).primaryColorLight,
                  Theme.of(context).primaryColorDark,
                ],
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: IconButton(
                        onPressed: () => widget.state.backOnPressed(context),
                        icon: Icon(
                          Icons.arrow_back_outlined,
                          size: 32,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, left: 25),
                      child: Text(
                        S.of(context).video_surveillance,
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 36, fontWeight: FontWeight.w200),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  widget.state.videoController!.value.isInitialized
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Theme.of(context).primaryColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                AspectRatio(
                                  aspectRatio: widget
                                      .state.videoController!.value.aspectRatio,
                                  child: VideoPlayer(
                                    widget.state.videoController!,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    S.of(context).camera_1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                  widget.state.videoController!.value.isInitialized
                      ? const SizedBox(height: 20)
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
