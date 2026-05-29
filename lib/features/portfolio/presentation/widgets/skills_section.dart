import 'package:flutter/material.dart';
import 'package:portfolio_app/core/utils/breakpoints.dart';
import 'package:portfolio_app/core/widgets/fade_in_up.dart';
import 'package:portfolio_app/core/widgets/glass_container.dart';
import 'package:portfolio_app/core/widgets/section_title.dart';
import 'package:portfolio_app/features/portfolio/domain/models.dart';
import 'package:portfolio_app/features/portfolio/data/portfolio_data.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    final isDesktop = Breakpoints.isDesktop(width);
    final theme = Theme.of(context);

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
                  title: 'Skills',
                  subtitle:
                      'Flutter-first, React Native roots, and production-grade tooling.',
                  icon: Icons.engineering_rounded,
                ),
              ),
              const SizedBox(height: 22),
              FadeInUp(
                delay: const Duration(milliseconds: 90),
                child: GlassContainer(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    children: [
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: PortfolioData.skillGroups.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isDesktop ? 3 : 1,
                          mainAxisSpacing: 14,
                          crossAxisSpacing: 14,
                          childAspectRatio: isDesktop ? 0.95 : 1.05,
                        ),
                        itemBuilder: (context, index) {
                          final group = PortfolioData.skillGroups[index];
                          final progress =
                              [0.95, 0.72, 0.65][index].clamp(0, 1);
                          return _SkillGroupCard(
                            group: group,
                            progress: progress.toDouble(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              FadeInUp(
                delay: const Duration(milliseconds: 120),
                child: Text(
                  'I build with clean architecture, null-safe Dart, and responsive UI patterns.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    height: 1.6,
                    fontWeight: FontWeight.w600,
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

class _SkillGroupCard extends StatelessWidget {
  const _SkillGroupCard({required this.group, required this.progress});

  final SkillGroup group;
  final double progress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
            color: theme.colorScheme.outline.withValues(alpha: 0.14)),
        color: theme.colorScheme.surface.withValues(alpha: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.circle_outlined,
                  size: 14, color: theme.colorScheme.primary),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  group.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.2,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            borderRadius: BorderRadius.circular(999),
            backgroundColor: theme.colorScheme.outline.withValues(alpha: 0.08),
            color: theme.colorScheme.primary,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final item in group.items)
                Chip(
                  label: Text(item),
                  padding: EdgeInsets.zero,
                  backgroundColor:
                      theme.colorScheme.primary.withValues(alpha: 0.12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                    side: BorderSide(
                      color: theme.colorScheme.primary.withValues(alpha: 0.22),
                      width: 0.7,
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
