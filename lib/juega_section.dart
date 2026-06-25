import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'opm_data.dart';

class JuegaSection extends StatefulWidget {
  const JuegaSection({super.key});

  @override
  State<JuegaSection> createState() => _JuegaSectionState();
}

class _JuegaSectionState extends State<JuegaSection>
    with SingleTickerProviderStateMixin {
  int _currentQuestion = 0;
  int _score = 0;
  int? _selectedOption;
  bool _answered = false;
  bool _finished = false;
  late AnimationController _animController;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _scaleAnim = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _answer(int index) {
    if (_answered) return;
    setState(() {
      _selectedOption = index;
      _answered = true;
      if (index == quizQuestions[_currentQuestion].correctIndex) {
        _score++;
      }
    });
    _animController.forward().then((_) => _animController.reverse());
    Future.delayed(const Duration(milliseconds: 800), _nextQuestion);
  }

  void _nextQuestion() {
    if (_currentQuestion < quizQuestions.length - 1) {
      setState(() {
        _currentQuestion++;
        _selectedOption = null;
        _answered = false;
      });
    } else {
      setState(() => _finished = true);
    }
  }

  void _restart() {
    setState(() {
      _currentQuestion = 0;
      _score = 0;
      _selectedOption = null;
      _answered = false;
      _finished = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_finished) return _buildResults();
    return _buildQuiz();
  }

  Widget _buildQuiz() {
    final q = quizQuestions[_currentQuestion];
    final progress = (_currentQuestion + 1) / quizQuestions.length;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          _buildHeader(),
          const SizedBox(height: 24),
          _buildProgressBar(progress),
          const SizedBox(height: 32),
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.electricCyan.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'PREGUNTA ${_currentQuestion + 1}/${quizQuestions.length}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.3,
                    color: AppTheme.electricCyan,
                  ),
                ),
              ),
              const Spacer(),
              _buildScoreBadge(),
            ],
          ),
          const SizedBox(height: 20),
          ScaleTransition(
            scale: _scaleAnim,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppTheme.carbon,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppTheme.pearl.withValues(alpha: 0.08),
                ),
              ),
              child: Text(
                q.question,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  height: 1.4,
                  letterSpacing: 0.5,
                  color: AppTheme.luminous,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          ...q.options.asMap().entries.map((entry) {
            final i = entry.key;
            final option = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _buildOption(i, option, q.correctIndex),
            );
          }),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Trivia One Punch',
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
          '¿Cuánto sabes sobre One Punch Man?',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.5,
            letterSpacing: 0.4,
            color: AppTheme.mist,
          ),
        ),
      ],
    );
  }

  Widget _buildProgressBar(double progress) {
    return Container(
      height: 4,
      decoration: BoxDecoration(
        color: AppTheme.slateVeil,
        borderRadius: BorderRadius.circular(2),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress,
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.electricCyan,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    );
  }

  Widget _buildScoreBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.tealPulse.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star, color: AppTheme.tealPulse, size: 14),
          const SizedBox(width: 6),
          Text(
            '$_score',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.35,
              color: AppTheme.tealPulse,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOption(int index, String option, int correctIndex) {
    Color bgColor;
    Color borderColor;
    Color textColor;

    if (_answered && index == correctIndex) {
      bgColor = AppTheme.tealPulse.withValues(alpha: 0.15);
      borderColor = AppTheme.tealPulse;
      textColor = AppTheme.tealPulse;
    } else if (_answered && index == _selectedOption && index != correctIndex) {
      bgColor = Colors.red.withValues(alpha: 0.15);
      borderColor = Colors.redAccent;
      textColor = Colors.redAccent;
    } else if (_answered && index != correctIndex) {
      bgColor = AppTheme.carbon;
      borderColor = AppTheme.pearl.withValues(alpha: 0.08);
      textColor = AppTheme.mist;
    } else {
      bgColor = AppTheme.carbon;
      borderColor = AppTheme.pearl.withValues(alpha: 0.12);
      textColor = AppTheme.luminous;
    }

    return GestureDetector(
      onTap: () => _answer(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: _answered && index == correctIndex
                      ? AppTheme.tealPulse
                      : textColor.withValues(alpha: 0.4),
                ),
                color: _answered && index == correctIndex
                    ? AppTheme.tealPulse
                    : (_answered &&
                            index == _selectedOption &&
                            index != correctIndex)
                        ? Colors.redAccent
                        : Colors.transparent,
              ),
              child: Center(
                child: Text(
                  String.fromCharCode(65 + index),
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: _answered && (index == correctIndex ||
                            (index == _selectedOption &&
                                index != correctIndex))
                        ? AppTheme.deepInk
                        : textColor,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Text(
              option,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1.4,
                letterSpacing: 0.4,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResults() {
    final allCorrect = _score == quizQuestions.length;
    final emoji = allCorrect
        ? '👊'
        : _score >= 7
            ? '💪'
            : _score >= 4
                ? '😐'
                : '🥚';

    final tweet = allCorrect
        ? '¡Eres un verdadero héroe Clase S! Sabes todo sobre One Punch Man.'
        : _score >= 7
            ? '¡Bien hecho, héroe Clase A! Conoces bien el universo OPM.'
            : _score >= 4
                ? 'Nada mal, héroe Clase B. Pero aún puedes mejorar tu entrenamiento.'
                : '100 flexiones, 100 abdominales... ¡Te falta entrenamiento, héroe Clase C!';

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(height: 40),
          Text(emoji, style: const TextStyle(fontSize: 72)),
          const SizedBox(height: 24),
          const Text(
            'Resultado Final',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              height: 1.2,
              letterSpacing: 0.7,
              color: AppTheme.luminous,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            decoration: BoxDecoration(
              color: AppTheme.electricCyan,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '$_score / ${quizQuestions.length}',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                height: 1.2,
                letterSpacing: 1.0,
                color: AppTheme.deepInk,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppTheme.carbon,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppTheme.pearl.withValues(alpha: 0.08),
              ),
            ),
            child: Text(
              tweet,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1.5,
                letterSpacing: 0.4,
                color: AppTheme.luminous,
              ),
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _restart,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.electricCyan,
                foregroundColor: AppTheme.deepInk,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.4,
                ),
              ),
              child: const Text('JUGAR DE NUEVO'),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
