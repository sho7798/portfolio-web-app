import 'package:flutter/material.dart';
import 'package:portfolio_app/app/theme/theme_controller.dart';
import 'package:portfolio_app/core/utils/breakpoints.dart';
import 'package:portfolio_app/core/widgets/glass_container.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({
    super.key,
    required this.personName,
    required this.onNavigate,
    required this.themeController,
  });

  final String personName;
  final ThemeController themeController;
  final void Function(String sectionId) onNavigate;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = Breakpoints.isDesktop(width);

    Widget themeToggle() {
      return IconButton(
        tooltip: 'Toggle theme',
        onPressed: themeController.toggle,
        icon: Icon(
          themeController.themeMode == ThemeMode.dark
              ? Icons.dark_mode
              : Icons.light_mode,
        ),
      );
    }

    final navItems = <_NavItem>[
      const _NavItem(id: 'about', label: 'About'),
      const _NavItem(id: 'skills', label: 'Skills'),
      const _NavItem(id: 'experience', label: 'Experience'),
      const _NavItem(id: 'projects', label: 'Projects'),
      const _NavItem(id: 'services', label: 'Services'),
      const _NavItem(id: 'contact', label: 'Contact'),
    ];

    return GlassContainer(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context)
                        .colorScheme
                        .primary
                        .withValues(alpha: 0.14),
                  ),
                  child: Icon(Icons.code,
                      color: Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(width: 12),
                Text(
                  personName,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.2,
                      ),
                ),
              ],
            ),
          ),
          if (isDesktop) ...[
            Wrap(
              spacing: 6,
              runSpacing: 6,
              alignment: WrapAlignment.center,
              children: [
                for (final item in navItems)
                  TextButton(
                    onPressed: () => onNavigate(item.id),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      foregroundColor: Theme.of(context).colorScheme.onSurface,
                    ),
                    child: Text(item.label,
                        style: const TextStyle(fontWeight: FontWeight.w700)),
                  ),
              ],
            ),
            themeToggle(),
          ] else ...[
            themeToggle(),
            PopupMenuButton<String>(
              tooltip: 'Navigate',
              icon: const Icon(Icons.menu),
              itemBuilder: (_) => [
                for (final item in navItems)
                  PopupMenuItem<String>(
                    value: item.id,
                    child: Text(item.label),
                  ),
              ],
              onSelected: (id) => onNavigate(id),
            ),
          ]
        ],
      ),
    );
  }
}

class _NavItem {
  const _NavItem({required this.id, required this.label});
  final String id;
  final String label;
}
