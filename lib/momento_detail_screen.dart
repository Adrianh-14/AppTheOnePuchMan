import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'opm_data.dart';
import 'package:video_player/video_player.dart';

class MomentoDetailScreen extends StatefulWidget {
  final Momento momento;
  const MomentoDetailScreen({super.key, required this.momento});

  @override
  State<MomentoDetailScreen> createState() => _MomentoDetailScreenState();
}

class _MomentoDetailScreenState extends State<MomentoDetailScreen> {
  late VideoPlayerController _videoController;
  bool _isPlaying = false;
  bool _isInitialized = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.networkUrl(
      Uri.parse(widget.momento.videoUrl),
    );
    _videoController.addListener(() {
      if (mounted) setState(() {});
    });
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      await _videoController.initialize();
      if (mounted) {
        setState(() => _isInitialized = true);
      }
    } catch (_) {
      if (mounted) {
        setState(() => _hasError = true);
      }
    }
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (_isPlaying) {
      _videoController.pause();
    } else {
      _videoController.play();
    }
    setState(() => _isPlaying = !_isPlaying);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.midnightCanvas,
      appBar: AppBar(
        backgroundColor: AppTheme.abyss,
        title: const Text('Momento'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.luminous),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildVideoPlayer(),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.momento.title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                      letterSpacing: 0.7,
                      color: AppTheme.luminous,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.momento.description,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      letterSpacing: 0.4,
                      color: AppTheme.fog,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppTheme.carbon,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppTheme.pearl.withValues(alpha: 0.08),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.info_outline,
                            color: AppTheme.tealPulse, size: 24),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            'Video incrustado - se reproduce directamente en la aplicación.',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              letterSpacing: 0.35,
                              color: AppTheme.tealPulse,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoPlayer() {
    if (_hasError) {
      return Container(
        height: 250,
        color: AppTheme.carbon,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.videocam_off, size: 48, color: AppTheme.mist),
              SizedBox(height: 12),
              Text(
                'Video no disponible\n(solo demostraci\u00F3n)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.mist,
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (!_isInitialized) {
      return Container(
        height: 250,
        color: AppTheme.carbon,
        child: const Center(
          child: CircularProgressIndicator(color: AppTheme.electricCyan),
        ),
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.zero,
          child: AspectRatio(
            aspectRatio: _videoController.value.aspectRatio,
            child: VideoPlayer(_videoController),
          ),
        ),
        if (!_isPlaying)
          GestureDetector(
            onTap: _togglePlayPause,
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.electricCyan.withValues(alpha: 0.9),
              ),
              child: const Icon(Icons.play_arrow,
                  color: AppTheme.deepInk, size: 36),
            ),
          ),
        if (_isPlaying)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: _togglePlayPause,
              child: Container(
                height: 44,
                color: Colors.black.withValues(alpha: 0.6),
                child: Center(
                  child: Icon(
                    _videoController.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: AppTheme.luminous,
                    size: 28,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
