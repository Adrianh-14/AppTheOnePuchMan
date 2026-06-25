import 'dart:async';
import 'package:flutter/material.dart';
import 'app_theme.dart';

class PortadaSection extends StatefulWidget {
  const PortadaSection({super.key});

  @override
  State<PortadaSection> createState() => _PortadaSectionState();
}

class _PortadaSectionState extends State<PortadaSection> {
  final PageController _controller = PageController(viewportFraction: 1.0);
  int _currentPage = 0;
  Timer? _timer;

  final List<_Slide> _slides = const [
    _Slide(
      image: 'assets/images/intro.jpg',
      title: 'ONE PUNCH\nMAN',
      subtitle: 'Un héroe por diversión',
    ),
    _Slide(
      image: 'assets/images/saitama.jpg',
      title: 'SAITAMA',
      subtitle: 'El hombre más fuerte del mundo',
    ),
    _Slide(
      image: 'assets/images/Genos.jpg',
      title: 'GENOS',
      subtitle: 'El discípulo cyborg',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (_currentPage < _slides.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 3 / 2,
            child: Stack(
              children: [
                PageView.builder(
                  controller: _controller,
                  itemCount: _slides.length,
                  onPageChanged: (i) => setState(() => _currentPage = i),
                  itemBuilder: (context, i) => _buildSlide(_slides[i]),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 16,
                  child: _buildIndicators(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          _buildSectionHeader('Descubre el mundo', 'de One Punch Man'),
          const SizedBox(height: 20),
          _buildSynopsisCard(),
          const SizedBox(height: 32),
          _buildSectionHeader('Disponible ahora', 'Comienza a explorar'),
          const SizedBox(height: 20),
          _buildCtaBanner(),
          const SizedBox(height: 48),
        ],
      ),
    );
  }

  Widget _buildSlide(_Slide slide) {
    return Container(
      color: AppTheme.abyss,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Image.asset(
              slide.image,
              fit: BoxFit.contain,
              errorBuilder: (_, e, s) => Container(color: AppTheme.carbon),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Color(0x99040714),
                  Color(0xFF040714),
                ],
                stops: [0.4, 0.75, 1.0],
              ),
            ),
          ),
          Positioned(
            left: 32,
            right: 32,
            bottom: 72,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  slide.title,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    height: 1.15,
                    letterSpacing: 1.0,
                    color: AppTheme.luminous,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  slide.subtitle,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    letterSpacing: 0.45,
                    color: AppTheme.tealPulse,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _slides.length,
        (i) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: _currentPage == i ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: _currentPage == i
                ? AppTheme.electricCyan
                : AppTheme.luminous.withValues(alpha: 0.3),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              height: 1.2,
              letterSpacing: 0.7,
              color: AppTheme.luminous,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              height: 1.5,
              letterSpacing: 0.4,
              color: AppTheme.mist,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSynopsisCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.carbon,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppTheme.pearl.withValues(alpha: 0.08),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: AppTheme.electricCyan.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'ANIME ORIGINAL',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.3,
                    color: AppTheme.electricCyan,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: AppTheme.tealPulse.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'ACCIÓN / COMEDIA',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.3,
                    color: AppTheme.tealPulse,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Saitama es un héroe por diversión. Después de tres años de '
            'entrenamiento, se ha vuelto tan fuerte que puede derrotar a '
            'cualquier enemigo de un solo golpe. El problema: '
            'la emoción de la batalla ha desaparecido.',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              height: 1.5,
              letterSpacing: 0.4,
              color: AppTheme.luminous,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCtaBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
      decoration: BoxDecoration(
        color: AppTheme.electricCyan,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.play_circle_filled, color: AppTheme.deepInk, size: 28),
          const SizedBox(width: 14),
          const Expanded(
            child: Text(
              'Explora todos los personajes y momentos',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                height: 1.4,
                letterSpacing: 0.4,
                color: AppTheme.deepInk,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Slide {
  final String image;
  final String title;
  final String subtitle;

  const _Slide({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}
