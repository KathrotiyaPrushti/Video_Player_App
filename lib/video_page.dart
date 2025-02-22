import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {
  final String category;
  final String videoPath;
  final bool isYouTube;

  VideoPage({required this.category, required this.videoPath, required this.isYouTube});

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  VideoPlayerController? _videoController;
  ChewieController? _chewieController;
  YoutubePlayerController? _youtubeController;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  void _initializePlayer() {
    if (widget.isYouTube) {
      String? videoId = YoutubePlayer.convertUrlToId(widget.videoPath);
      if (videoId != null) {
        _youtubeController = YoutubePlayerController(
          initialVideoId: videoId,
          flags: YoutubePlayerFlags(autoPlay: true, mute: false),
        );
      }
    } else {
      _videoController = widget.videoPath.startsWith("assets/")
          ? VideoPlayerController.asset(widget.videoPath)
          : VideoPlayerController.network(widget.videoPath);

      _videoController!.initialize().then((_) {
        setState(() {});
      });

      _chewieController = ChewieController(
        videoPlayerController: _videoController!,
        aspectRatio: 16 / 9,
        autoPlay: true,
        looping: true,
      );
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    _chewieController?.dispose();
    _youtubeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category)),
      body: Center(
        child: widget.isYouTube
            ? YoutubePlayer(controller: _youtubeController!, showVideoProgressIndicator: true)
            : (_videoController != null && _videoController!.value.isInitialized)
                ? AspectRatio(
                    aspectRatio: _videoController!.value.aspectRatio,
                    child: Chewie(controller: _chewieController!),
                  )
                : CircularProgressIndicator(),
      ),
    );
  }
}
