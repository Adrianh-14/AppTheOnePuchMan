import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'opm_data.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Character character;
  const CharacterDetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.midnightCanvas,
      appBar: AppBar(
        backgroundColor: AppTheme.abyss,
        title: Text(character.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.luminous),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 380,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(color: AppTheme.abyss),
                  Center(
                    child: Image.asset(
                      character.imageAsset,
                      fit: BoxFit.contain,
                      errorBuilder: (_, e, s) =>
                          Container(color: AppTheme.carbon),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Color(0xCC040714),
                          Color(0xFF040714),
                        ],
                        stops: [0.5, 0.8, 1.0],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 24,
                    right: 24,
                    bottom: 24,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppTheme.electricCyan,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            character.rank,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.3,
                              color: AppTheme.deepInk,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          character.name,
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                            letterSpacing: 1.0,
                            color: AppTheme.luminous,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '"${character.heroName}"',
                          style: const TextStyle(
                            fontSize: 18,
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
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoBlock('Habilidades', character.abilities),
                  const SizedBox(height: 24),
                  _buildInfoBlock('Historia', character.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBlock(String label, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
            color: AppTheme.electricCyan,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.5,
            letterSpacing: 0.4,
            color: AppTheme.luminous,
          ),
        ),
      ],
    );
  }
}
