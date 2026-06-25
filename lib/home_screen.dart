import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'portada_section.dart';
import 'personajes_section.dart';
import 'momentos_section.dart';
import 'acerca_section.dart';
import 'juega_section.dart';
import 'creador_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _sections = const [
    PortadaSection(),
    PersonajesSection(),
    MomentosSection(),
    AcercaSection(),
    JuegaSection(),
    CreadorSection(),
  ];

  static const List<String> _titles = [
    'ONE PUNCH MAN',
    'Personajes',
    'Momentos',
    'Acerca de',
    'Juega Conmigo',
    'Creador',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.midnightCanvas,
      appBar: _currentIndex == 0
          ? AppBar(
              backgroundColor: AppTheme.abyss.withValues(alpha: 0.95),
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.local_fire_department,
                      color: AppTheme.electricCyan, size: 22),
                  const SizedBox(width: 8),
                  const Text(
                    'ONE PUNCH MAN',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                      color: AppTheme.luminous,
                    ),
                  ),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1),
                child: Container(
                  color: AppTheme.pearl.withValues(alpha: 0.08),
                  height: 1,
                ),
              ),
            )
          : AppBar(
              backgroundColor: AppTheme.abyss,
              elevation: 0,
              title: Text(
                _titles[_currentIndex],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.45,
                  color: AppTheme.luminous,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1),
                child: Container(
                  color: AppTheme.pearl.withValues(alpha: 0.08),
                  height: 1,
                ),
              ),
            ),
      body: _sections[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppTheme.pearl.withValues(alpha: 0.08),
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          backgroundColor: AppTheme.abyss,
          selectedItemColor: AppTheme.electricCyan,
          unselectedItemColor: AppTheme.mist,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Portada',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_outline),
              activeIcon: Icon(Icons.people),
              label: 'Personajes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.photo_library_outlined),
              activeIcon: Icon(Icons.photo_library),
              label: 'Momentos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              activeIcon: Icon(Icons.info),
              label: 'Acerca de',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_esports_outlined),
              activeIcon: Icon(Icons.sports_esports),
              label: 'Juega',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Creador',
            ),
          ],
        ),
      ),
    );
  }
}
