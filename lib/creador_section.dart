import 'package:flutter/material.dart';
import 'app_theme.dart';

class CreadorSection extends StatelessWidget {
  const CreadorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(height: 16),
          _buildPhotoCard(),
          const SizedBox(height: 24),
          _buildInfoCard(),
          const SizedBox(height: 20),
          _buildDescriptionCard(),
          const SizedBox(height: 20),
          _buildStatsRow(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildPhotoCard() {
    return Container(
      width: 180,
      height: 180,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppTheme.electricCyan, width: 3),
        boxShadow: [
          BoxShadow(
            color: AppTheme.electricCyan.withValues(alpha: 0.15),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        'assets/images/MiFotopersonal.jpg',
        fit: BoxFit.cover,
        errorBuilder: (_, e, s) => Container(
          color: AppTheme.carbon,
          child: const Icon(Icons.person, color: AppTheme.mist, size: 60),
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.carbon,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppTheme.pearl.withValues(alpha: 0.08),
        ),
      ),
      child: Column(
        children: [
          const Text(
            'Adrian Hendrix de Jesus',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              height: 1.2,
              letterSpacing: 0.5,
              color: AppTheme.luminous,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.electricCyan.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'ESTUDIANTE ITLA',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
                color: AppTheme.electricCyan,
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildContactRow(Icons.school, 'Instituto Tecnológico de Las Américas'),
          const SizedBox(height: 12),
          _buildContactRow(Icons.work, '1 año en sector financiero'),
          const SizedBox(height: 12),
          _buildContactRow(Icons.code, 'Desarrollador en formación'),
        ],
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String text) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: AppTheme.tealPulse.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: AppTheme.tealPulse, size: 18),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.4,
              letterSpacing: 0.35,
              color: AppTheme.luminous,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.electricCyan.withValues(alpha: 0.06),
            AppTheme.tealPulse.withValues(alpha: 0.03),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppTheme.electricCyan.withValues(alpha: 0.12),
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.format_quote, color: AppTheme.electricCyan, size: 22),
              SizedBox(width: 8),
              Text(
                'SOBRE MÍ',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                  color: AppTheme.electricCyan,
                ),
              ),
            ],
          ),
          SizedBox(height: 14),
          Text(
            'Joven estudiante del ITLA apasionado por la tecnología y el desarrollo continuo, buscando siempre la solución a problemas complejos. Actualmente cursando mis últimas materias para graduarme, con un año de experiencia en el sector financiero, y con intereses de aprender en más áreas y llevar mi carrera al siguiente nivel.',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              height: 1.6,
              letterSpacing: 0.4,
              color: AppTheme.luminous,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    const items = [
      _StatItem(icon: Icons.flag, label: 'Metas', value: 'Graduarme'),
      _StatItem(icon: Icons.code, label: 'Área', value: 'Desarrollo'),
      _StatItem(icon: Icons.trending_up, label: 'Interés', value: 'Crecer'),
    ];

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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map((item) {
          return Column(
            children: [
              Icon(item.icon, color: AppTheme.electricCyan, size: 28),
              const SizedBox(height: 6),
              Text(
                item.value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  height: 1.3,
                  letterSpacing: 0.35,
                  color: AppTheme.luminous,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                item.label,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  height: 1.3,
                  letterSpacing: 0.3,
                  color: AppTheme.mist,
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class _StatItem {
  final IconData icon;
  final String label;
  final String value;
  const _StatItem({
    required this.icon,
    required this.label,
    required this.value,
  });
}
