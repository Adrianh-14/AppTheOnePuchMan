import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'opm_data.dart';
import 'momento_detail_screen.dart';

class MomentosSection extends StatelessWidget {
  const MomentosSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Momentos Favoritos',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                  letterSpacing: 0.7,
                  color: AppTheme.luminous,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Revive las mejores escenas de la serie',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  letterSpacing: 0.4,
                  color: AppTheme.mist,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        ...momentos.asMap().entries.map((entry) {
          final i = entry.key;
          final m = entry.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
            child: _MomentoCard(momento: m, index: i),
          );
        }),
        const SizedBox(height: 32),
      ],
      ),
    );
  }
}

class _MomentoCard extends StatelessWidget {
  final Momento momento;
  final int index;

  const _MomentoCard({required this.momento, required this.index});

  @override
  Widget build(BuildContext context) {
    final labels = ['MOMENTO ÉPICO', 'ORIGEN', 'REUNIÓN'];
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => MomentoDetailScreen(momento: momento),
          ),
        );
      },
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppTheme.pearl.withValues(alpha: 0.1),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              momento.imageAsset,
              fit: BoxFit.cover,
                errorBuilder: (_, e, s) => Container(color: AppTheme.carbon),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.7),
                    Colors.black.withValues(alpha: 0.9),
                  ],
                  stops: const [0.2, 0.6, 1.0],
                ),
              ),
            ),
            Positioned(
              top: 12,
              left: 12,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppTheme.electricCyan,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  labels[index],
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.3,
                    color: AppTheme.deepInk,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    momento.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      height: 1.4,
                      letterSpacing: 0.5,
                      color: AppTheme.luminous,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.play_circle_filled,
                          color: AppTheme.electricCyan, size: 20),
                      const SizedBox(width: 8),
                      const Text(
                        'Ver video',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.35,
                          color: AppTheme.electricCyan,
                        ),
                      ),
                      const Spacer(),
                      Icon(Icons.chevron_right,
                          color: AppTheme.luminous.withValues(alpha: 0.6)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
