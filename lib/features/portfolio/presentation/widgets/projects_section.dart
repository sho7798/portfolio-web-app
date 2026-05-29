import 'package:flutter/material.dart';
import 'package:portfolio_app/core/utils/breakpoints.dart';
import 'package:portfolio_app/core/widgets/fade_in_up.dart';
import 'package:portfolio_app/core/widgets/glass_container.dart';
import 'package:portfolio_app/core/widgets/hover_card.dart';
import 'package:portfolio_app/core/widgets/section_title.dart';
import 'package:portfolio_app/features/portfolio/data/portfolio_data.dart';
import 'package:portfolio_app/features/portfolio/domain/models.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key, required this.width});

  final double width;

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  String _selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    final categories = <String>{
      'All',
      ...PortfolioData.projects.map((p) => p.category),
    }.toList();
    categories.sort((a, b) => a.compareTo(b));

    final filtered = _selectedCategory == 'All'
        ? PortfolioData.projects
        : PortfolioData.projects
            .where((p) => p.category == _selectedCategory)
            .toList();

    final isDesktop = Breakpoints.isDesktop(widget.width);

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
                  title: 'Projects',
                  subtitle:
                      'A selection of cross-platform mobile applications.',
                  icon: Icons.layers_outlined,
                ),
              ),
              const SizedBox(height: 18),
              FadeInUp(
                delay: const Duration(milliseconds: 90),
                child: GlassContainer(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    children: [
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          for (final c in categories)
                            ChoiceChip(
                              label: Text(c),
                              selected: _selectedCategory == c,
                              onSelected: (_) =>
                                  setState(() => _selectedCategory = c),
                            ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: filtered.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isDesktop ? 3 : 1,
                          mainAxisSpacing: 14,
                          crossAxisSpacing: 14,
                          childAspectRatio: isDesktop ? 0.82 : 1.1,
                        ),
                        itemBuilder: (context, index) {
                          return _ProjectCard(project: filtered[index]);
                        },
                      ),
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

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.project});

  final ProjectItem project;

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    if (!await canLaunchUrl(uri)) return;
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return HoverCard(
      padding: const EdgeInsets.all(14),
      onTap: null,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 112,
              decoration: BoxDecoration(
                gradient: project.gradient,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: -18,
                    top: -18,
                    child: Icon(project.icon,
                        size: 64, color: Colors.white.withValues(alpha: 0.28)),
                  ),
                  Positioned(
                    left: 14,
                    top: 14,
                    child: Chip(
                      label: Text(project.category),
                      backgroundColor: Colors.white.withValues(alpha: 0.14),
                      side: const BorderSide(color: Colors.white54),
                    ),
                  ),
                  Positioned(
                    left: 14,
                    bottom: 12,
                    child: Text(
                      project.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              project.description,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                height: 1.55,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final t in project.technologies.take(4))
                  Chip(
                    label: Text(t),
                    backgroundColor:
                        theme.colorScheme.surface.withValues(alpha: 0.45),
                    side: BorderSide(
                        color:
                            theme.colorScheme.outline.withValues(alpha: 0.14)),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Features',
              style: theme.textTheme.labelLarge
                  ?.copyWith(fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 8),
            for (final f in project.features.take(2))
              Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.check_circle_rounded,
                        size: 16, color: theme.colorScheme.primary),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        f,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                          height: 1.4,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.code_outlined, size: 18),
                    label: const Text('GitHub'),
                    onPressed: () => _open(project.githubUrl),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      side: BorderSide(
                          color:
                              theme.colorScheme.outline.withValues(alpha: 0.6)),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                if (project.liveUrl != null)
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.open_in_new, size: 18),
                      label: const Text('Live'),
                      onPressed: () => _open(project.liveUrl!),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                        side: BorderSide(
                            color: theme.colorScheme.outline
                                .withValues(alpha: 0.6)),
                      ),
                    ),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
