import 'package:flutter/material.dart';
import 'app_theme.dart';

class AcercaSection extends StatelessWidget {
  const AcercaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const Text(
            'Acerca de la Obra',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              height: 1.2,
              letterSpacing: 0.7,
              color: AppTheme.luminous,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Todo lo que necesitas saber sobre One Punch Man',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.5,
              letterSpacing: 0.4,
              color: AppTheme.mist,
            ),
          ),
          const SizedBox(height: 32),
          _buildInfoCard(
            icon: Icons.person,
            label: 'Creador',
            value: 'ONE (Webcómic)\nYusuke Murata (Manga)',
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            icon: Icons.movie,
            label: 'Estudio de Animación',
            value: 'Madhouse (Temporada 1)\nJ.C.Staff (Temporada 2)',
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            icon: Icons.tv,
            label: 'Temporadas',
            value: '2 temporadas completas\nTemporada 3 anunciada',
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            icon: Icons.playlist_play,
            label: 'Episodios',
            value: '24 episodios (12 por temporada)\n+ OVAs especiales',
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            icon: Icons.category,
            label: 'Géneros',
            value: 'Acción, Comedia, Superhéroes,\nParodia, Seinen',
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            icon: Icons.calendar_today,
            label: 'Publicación',
            value: 'Webcómic: 2009 - presente\nManga: 2012 - presente\nAnime: 2015 - presente',
          ),
          const SizedBox(height: 32),
          _buildSynopsisCard(),
          const SizedBox(height: 24),
          _buildFunFactCards(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.carbon,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppTheme.pearl.withValues(alpha: 0.08),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppTheme.electricCyan.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppTheme.electricCyan, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.8,
                    color: AppTheme.mist,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    letterSpacing: 0.4,
                    color: AppTheme.luminous,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSynopsisCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.electricCyan.withValues(alpha: 0.08),
            AppTheme.tealPulse.withValues(alpha: 0.04),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppTheme.electricCyan.withValues(alpha: 0.15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.auto_stories,
                  color: AppTheme.electricCyan, size: 24),
              SizedBox(width: 12),
              Text(
                'SINOPSIS',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                  color: AppTheme.electricCyan,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Saitama es un joven que se convirtió en héroe por diversión. '
            'Después de tres años de entrenamiento extremo, obtiene un poder '
            'inimaginable: puede derrotar a cualquier enemigo de un solo golpe. '
            'Sin embargo, su fuerza absoluta se convierte en su mayor problema: '
            'ya no siente la emoción del combate. Junto a su discípulo Genos, '
            'Saitama navega por el mundo de la Asociación de Héroes, enfrentando '
            'monstruos, villanos y el absurdo de ser demasiado fuerte.',
            style: TextStyle(
              fontSize: 16,
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

  Widget _buildFunFactCards() {
    final facts = [
      {
        'emoji': '💪',
        'title': 'El entrenamiento',
        'desc':
            '100 flexiones, 100 abdominales, 100 sentadillas y 10 km de carrera. Todos los días.',
      },
      {
        'emoji': '🥚',
        'title': 'El huevo del día',
        'desc':
            'Saitama siempre busca ofertas en el supermercado. Es su verdadera batalla diaria.',
      },
      {
        'emoji': '🎮',
        'title': 'King vs Saitama',
        'desc':
            'King siempre le gana a Saitama en videojuegos. Es lo único que frustra al héroe.',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'DATOS CURIOSOS',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
            color: AppTheme.electricCyan,
          ),
        ),
        const SizedBox(height: 16),
        ...facts.map((f) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.carbon,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppTheme.pearl.withValues(alpha: 0.08),
                  ),
                ),
                child: Row(
                  children: [
                    Text(f['emoji']!, style: const TextStyle(fontSize: 28)),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            f['title']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              height: 1.4,
                              letterSpacing: 0.4,
                              color: AppTheme.luminous,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            f['desc']!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              letterSpacing: 0.35,
                              color: AppTheme.mist,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
