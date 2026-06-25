import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'opm_data.dart';
import 'character_detail_screen.dart';

class PersonajesSection extends StatelessWidget {
  const PersonajesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          _buildSectionHeader(),
          const SizedBox(height: 20),
          _buildRankChips(),
          const SizedBox(height: 20),
          SizedBox(
            height: 275,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: characters.length,
              itemBuilder: (context, i) => _CharacterCard(
                character: characters[i],
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSectionHeader() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Héroes',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              height: 1.2,
              letterSpacing: 0.7,
              color: AppTheme.luminous,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Conoce a los personajes más poderosos',
            style: TextStyle(
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

  Widget _buildRankChips() {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: characters.map((c) {
          final isSClass = c.rank.contains('Clase S');
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: isSClass
                    ? AppTheme.electricCyan.withValues(alpha: 0.1)
                    : AppTheme.carbon,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSClass
                      ? AppTheme.electricCyan.withValues(alpha: 0.3)
                      : AppTheme.pearl.withValues(alpha: 0.12),
                ),
              ),
              child: Text(
                c.heroName,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.35,
                  color: isSClass ? AppTheme.electricCyan : AppTheme.luminous,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _CharacterCard extends StatelessWidget {
  final Character character;
  const _CharacterCard({required this.character});

  @override
  Widget build(BuildContext context) {
    final rankNumber = character.rank.replaceAll(RegExp(r'[^0-9]'), '');

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => CharacterDetailScreen(character: character),
          ),
        );
      },
      child: Container(
        width: 145,
        margin: const EdgeInsets.only(right: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppTheme.carbon,
                ),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      character.imageAsset,
                      fit: BoxFit.contain,
                      errorBuilder: (_, e, s) =>
                          Container(color: AppTheme.carbon),
                    ),
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppTheme.electricCyan,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          '#$rankNumber',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.deepInk,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              character.name.toUpperCase(),
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                height: 1.3,
                letterSpacing: 0.35,
                color: AppTheme.luminous,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              character.heroName,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                height: 1.3,
                letterSpacing: 0.3,
                color: AppTheme.mist,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
