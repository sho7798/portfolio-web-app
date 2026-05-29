import 'package:flutter/material.dart';
import 'package:portfolio_app/core/utils/breakpoints.dart';
import 'package:portfolio_app/core/widgets/fade_in_up.dart';
import 'package:portfolio_app/core/widgets/glass_container.dart';
import 'package:portfolio_app/core/widgets/hover_card.dart';
import 'package:portfolio_app/core/widgets/section_title.dart';
import 'package:portfolio_app/features/portfolio/data/portfolio_data.dart';
import 'package:portfolio_app/features/portfolio/domain/models.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key, required this.width});

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
                  title: 'Services',
                  subtitle:
                      'End-to-end mobile delivery with Flutter and cross-platform quality.',
                  icon: Icons.build_circle_outlined,
                ),
              ),
              const SizedBox(height: 22),
              FadeInUp(
                delay: const Duration(milliseconds: 90),
                child: GlassContainer(
                  padding: const EdgeInsets.all(18),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: PortfolioData.services.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isDesktop ? 4 : 1,
                      mainAxisSpacing: 14,
                      crossAxisSpacing: 14,
                      childAspectRatio: isDesktop ? 0.92 : 1.1,
                    ),
                    itemBuilder: (context, index) {
                      final service = PortfolioData.services[index];
                      return _ServiceCard(service: service);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  const _ServiceCard({required this.service});

  final ServiceItem service;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return HoverCard(
      padding: const EdgeInsets.all(14),
      onTap: null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(service.icon, size: 20, color: theme.colorScheme.primary),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  service.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.2,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            service.description,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.5,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
