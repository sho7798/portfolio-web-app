import 'package:flutter/material.dart';
import 'package:portfolio_app/core/utils/breakpoints.dart';
import 'package:portfolio_app/core/widgets/fade_in_up.dart';
import 'package:portfolio_app/core/widgets/glass_container.dart';
import 'package:portfolio_app/core/widgets/hover_card.dart';
import 'package:portfolio_app/core/widgets/section_title.dart';
import 'package:portfolio_app/features/portfolio/data/portfolio_data.dart';
import 'package:portfolio_app/features/portfolio/domain/models.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key, required this.width});

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
                  title: 'Experience',
                  subtitle:
                      'React Native foundation, now Flutter-focused delivery.',
                  icon: Icons.work_outline,
                ),
              ),
              const SizedBox(height: 22),
              FadeInUp(
                delay: const Duration(milliseconds: 90),
                child: GlassContainer(
                  padding: const EdgeInsets.all(18),
                  child: _ExperienceList(isDesktop: isDesktop),
                ),
              ),
              const SizedBox(height: 28),
              const FadeInUp(
                delay: Duration(milliseconds: 40),
                child: SectionTitle(
                  title: 'Education',
                  subtitle: 'Academic background and qualifications.',
                  icon: Icons.school_outlined,
                ),
              ),
              const SizedBox(height: 18),
              FadeInUp(
                delay: const Duration(milliseconds: 90),
                child: GlassContainer(
                  padding: const EdgeInsets.all(18),
                  child: _EducationList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExperienceList extends StatelessWidget {
  const _ExperienceList({required this.isDesktop});

  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    const items = PortfolioData.experiences;

    return Column(
      children: List.generate(items.length, (index) {
        final item = items[index];
        return _ExperienceTimelineItem(
          item: item,
          showConnector: index != items.length - 1,
        );
      }),
    );
  }
}

class _ExperienceTimelineItem extends StatelessWidget {
  const _ExperienceTimelineItem({
    required this.item,
    required this.showConnector,
  });

  final ExperienceItem item;
  final bool showConnector;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dotColor = item.isPrimaryStack
        ? theme.colorScheme.primary
        : theme.colorScheme.secondary;

    Widget timelineDot() {
      return Column(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: dotColor.withValues(alpha: 0.18),
              border: Border.all(
                  color: dotColor.withValues(alpha: 0.9), width: 1.2),
            ),
            child: Center(
              child: Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: dotColor,
                ),
              ),
            ),
          ),
          if (showConnector)
            Container(
              width: 2,
              height: 56,
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: theme.colorScheme.outline.withValues(alpha: 0.18),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 32, child: timelineDot()),
          Expanded(
            child: HoverCard(
              padding: const EdgeInsets.all(14),
              onTap: null,
              child: _ExperienceCard(item: item),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  const _ExperienceCard({required this.item});

  final ExperienceItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              item.isPrimaryStack
                  ? Icons.flutter_dash
                  : Icons.phone_android_outlined,
              size: 20,
              color: item.isPrimaryStack
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.company,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                      letterSpacing: -0.2,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    item.position,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Chip(
              label: Text(item.duration),
              backgroundColor:
                  theme.colorScheme.primary.withValues(alpha: 0.12),
              side: BorderSide(
                  color: theme.colorScheme.primary.withValues(alpha: 0.25)),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _BulletBlock(
                title: 'Responsibilities',
                bullets: item.responsibilities,
              ),
            ),
            if (item.achievements.isNotEmpty) const SizedBox(width: 14),
            if (item.achievements.isNotEmpty)
              Expanded(
                child: _BulletBlock(
                  title: 'Key achievements',
                  bullets: item.achievements,
                ),
              ),
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final t in item.technologies)
              Chip(
                label: Text(t),
                backgroundColor:
                    theme.colorScheme.surface.withValues(alpha: 0.45),
                side: BorderSide(
                    color: theme.colorScheme.outline.withValues(alpha: 0.14)),
              ),
          ],
        ),
      ],
    );
  }
}

class _BulletBlock extends StatelessWidget {
  const _BulletBlock({required this.title, required this.bullets});

  final String title;
  final List<String> bullets;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 8),
        for (final b in bullets)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.circle, size: 7, color: theme.colorScheme.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    b,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      height: 1.45,
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

class _EducationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const items = PortfolioData.educations;

    return Column(
      children: List.generate(items.length, (index) {
        final e = items[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _EducationCard(item: e),
        );
      }),
    );
  }
}

class _EducationCard extends StatelessWidget {
  const _EducationCard({required this.item});

  final EducationItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return HoverCard(
      padding: const EdgeInsets.all(12),
      onTap: null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.school, size: 20, color: theme.colorScheme.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.institution,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${item.degree} • ${item.duration}',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item.description,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
