import 'package:flutter/material.dart';
import 'package:portfolio_app/core/widgets/fade_in_up.dart';
import 'package:portfolio_app/core/widgets/ghost_button.dart';
import 'package:portfolio_app/core/widgets/primary_button.dart';
import 'package:portfolio_app/core/widgets/typewriter_text.dart';
import 'package:portfolio_app/features/portfolio/data/portfolio_data.dart';
import 'package:portfolio_app/core/widgets/glass_container.dart';
import 'package:portfolio_app/core/widgets/secondary_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.width,
    required this.onContact,
    required this.onViewProjects,
    required this.onDownloadCv,
  });

  final double width;
  final VoidCallback onContact;
  final VoidCallback onViewProjects;
  final Future<void> Function() onDownloadCv;

  @override
  Widget build(BuildContext context) {
    final isDesktop = width > 1024;
    const name = PortfolioData.personName;
    final trimmed = name.trim();
    final initial = trimmed.isNotEmpty ? trimmed[0].toUpperCase() : 'U';
    final theme = Theme.of(context);

    final heroContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
          isDesktop ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        FadeInUp(
          delay: const Duration(milliseconds: 40),
          child: Text(
            PortfolioData.personRole,
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.2,
            ),
          ),
        ),
        const SizedBox(height: 12),
        FadeInUp(
          delay: const Duration(milliseconds: 90),
          child: Text(
            name,
            style: theme.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w900,
              letterSpacing: -1.1,
            ),
          ),
        ),
        const SizedBox(height: 14),
        FadeInUp(
          delay: const Duration(milliseconds: 130),
          child: TypewriterText(
            text: PortfolioData.heroStats.join(' • '),
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
              height: 1.35,
            ),
          ),
        ),
        const SizedBox(height: 18),
        FadeInUp(
          delay: const Duration(milliseconds: 180),
          child: Text(
            PortfolioData.intro,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.7,
            ),
          ),
        ),
        const SizedBox(height: 22),
        FadeInUp(
          delay: const Duration(milliseconds: 230),
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              PrimaryButton(
                label: 'Contact Me',
                icon: Icons.mail_outline,
                onPressed: onContact,
              ),
              SecondaryButton(
                label: 'Download CV',
                icon: Icons.download,
                onPressed: () async {
                  await onDownloadCv();
                },
              ),
              GhostButton(
                label: 'View Projects',
                icon: Icons.slideshow_outlined,
                onPressed: onViewProjects,
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        FadeInUp(
          delay: const Duration(milliseconds: 270),
          child: Row(
            children: [
              Icon(Icons.location_on_outlined,
                  size: 18, color: theme.colorScheme.primary),
              const SizedBox(width: 10),
              Text(
                'Available for freelance & full-time',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        )
      ],
    );

    final sideCard = FadeInUp(
      delay: const Duration(milliseconds: 150),
      child: HeroSideCard(width: width, initial: initial),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1120),
        child: isDesktop
            ? Flexible(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: heroContent),
                    const SizedBox(width: 20),
                    SizedBox(width: 420, child: sideCard),
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  heroContent,
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: sideCard,
                  ),
                ],
              ),
      ),
    );
  }
}

class HeroSideCard extends StatelessWidget {
  const HeroSideCard({
    super.key,
    required this.width,
    required this.initial,
  });

  final double width;
  final String initial;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const stats = PortfolioData.heroStats;

    return GlassContainer(
      padding: const EdgeInsets.all(16),
      borderRadius: 22,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor:
                    theme.colorScheme.primary.withValues(alpha: 0.18),
                foregroundColor: theme.colorScheme.primary,
                child: Text(
                  initial,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900, fontSize: 18),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mobile Developer',
                      style: theme.textTheme.titleSmall
                          ?.copyWith(fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Flutter-first • Cross-platform',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.waves, size: 22, color: theme.colorScheme.primary),
            ],
          ),
          const SizedBox(height: 14),
          const Divider(height: 1),
          const SizedBox(height: 14),
          GridView.builder(
            itemCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: width > 520 ? 3 : 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.1,
            ),
            itemBuilder: (context, index) {
              final title = stats[index];
              return _MiniStat(label: title);
            },
          ),
          const SizedBox(height: 12),
          Text(
            'Clean architecture, scalable codebases, and UI that feels premium.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.55,
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  const _MiniStat({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: theme.colorScheme.surface.withValues(alpha: 0.45),
        border: Border.all(
            color: theme.colorScheme.outline.withValues(alpha: 0.16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w800,
              height: 1.25,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 6,
            width: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              color: theme.colorScheme.primary.withValues(alpha: 0.12),
            ),
            child: LayoutBuilder(
              builder: (context, c) => TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.2, end: 1),
                duration: const Duration(milliseconds: 900),
                curve: Curves.easeOutCubic,
                builder: (context, v, _) {
                  return FractionallySizedBox(
                    widthFactor: v,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(999),
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
