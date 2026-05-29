import 'package:flutter/material.dart';
import 'package:portfolio_app/core/utils/breakpoints.dart';
import 'package:portfolio_app/core/widgets/fade_in_up.dart';
import 'package:portfolio_app/core/widgets/glass_container.dart';
import 'package:portfolio_app/core/widgets/section_title.dart';
import 'package:portfolio_app/features/portfolio/data/portfolio_data.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    final isDesktop = Breakpoints.isDesktop(width);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 44),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FadeInUp(
                delay: Duration(milliseconds: 40),
                child: SectionTitle(
                  title: 'About',
                  subtitle:
                      'From React Native to Flutter, with a focus on clean UX.',
                  icon: Icons.person_outline,
                ),
              ),
              const SizedBox(height: 22),
              FadeInUp(
                delay: const Duration(milliseconds: 90),
                child: GlassContainer(
                  padding: const EdgeInsets.all(18),
                  child: isDesktop
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: _AboutText(),
                            ),
                            const SizedBox(width: 16),
                            SizedBox(
                              width: 360,
                              child: _AboutHighlights(),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            _AboutText(),
                            const SizedBox(height: 16),
                            _AboutHighlights(),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AboutText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const intro = PortfolioData.intro;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'I started with React Native, building cross-platform mobile experiences for roughly two years. During that time, I became very focused on scalable UI patterns, reliable API integration, and building features that stay maintainable as the app grows.',
          style: theme.textTheme.bodyLarge?.copyWith(
            height: 1.75,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'Today, my focus is Flutter development. I enjoy translating product requirements into clean architectures, responsive interfaces, and subtle animations that improve usability without sacrificing performance.',
          style: theme.textTheme.bodyLarge?.copyWith(
            height: 1.75,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          intro,
          style: theme.textTheme.bodyLarge?.copyWith(
            height: 1.75,
            color: theme.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _AboutHighlights extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final bullets = [
      'Problem-solving mindset with careful implementation',
      'Clean UI development with strong attention to detail',
      'Cross-platform consistency with scalable patterns',
      'Performance-conscious animations and state flows',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How I work',
          style: theme.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 12),
        for (final b in bullets)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check_circle_rounded,
                    size: 18, color: theme.colorScheme.primary),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    b,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      height: 1.5,
                      color: theme.colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
