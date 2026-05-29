import 'package:flutter/material.dart';
import 'package:portfolio_app/app/theme/theme_controller.dart';
import 'package:portfolio_app/core/widgets/scroll_progress_indicator.dart';
import 'package:portfolio_app/features/portfolio/data/portfolio_data.dart';
import 'package:portfolio_app/features/portfolio/presentation/widgets/about_section.dart';
import 'package:portfolio_app/features/portfolio/presentation/widgets/contact_section.dart';
import 'package:portfolio_app/features/portfolio/presentation/widgets/experience_section.dart';
import 'package:portfolio_app/features/portfolio/presentation/widgets/hero_section.dart';
import 'package:portfolio_app/features/portfolio/presentation/widgets/projects_section.dart';
import 'package:portfolio_app/features/portfolio/presentation/widgets/services_section.dart';
import 'package:portfolio_app/features/portfolio/presentation/widgets/skills_section.dart';
import 'package:portfolio_app/features/portfolio/presentation/widgets/social_fab.dart';
import 'package:portfolio_app/features/portfolio/presentation/widgets/top_nav_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key, required this.themeController});

  final ThemeController themeController;

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final _scrollController = ScrollController();

  final _heroKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _experienceKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _servicesKey = GlobalKey();
  final _contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return;

    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeOutCubic,
    );
  }

  void _navigate(String sectionId) {
    switch (sectionId) {
      case 'about':
        _scrollTo(_aboutKey);
        break;
      case 'skills':
        _scrollTo(_skillsKey);
        break;
      case 'experience':
        _scrollTo(_experienceKey);
        break;
      case 'projects':
        _scrollTo(_projectsKey);
        break;
      case 'services':
        _scrollTo(_servicesKey);
        break;
      case 'contact':
        _scrollTo(_contactKey);
        break;
      default:
        _scrollTo(_heroKey);
    }
  }

  Future<void> _downloadCv() async {
    const url = PortfolioData.downloadCvUrl;
    final uri = Uri.parse(url);
    if (!await canLaunchUrl(uri)) return;
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final width = media.size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background gradient + subtle grid.
          Positioned.fill(
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context)
                          .colorScheme
                          .primary
                          .withValues(alpha: 0.18),
                      Theme.of(context).scaffoldBackgroundColor,
                      Theme.of(context)
                          .colorScheme
                          .primary
                          .withValues(alpha: 0.08),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const SizedBox.expand(),
              ),
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Opacity(
                opacity: Theme.of(context).brightness == Brightness.dark
                    ? 0.12
                    : 0.07,
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 12,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                  ),
                  itemBuilder: (_, __) => DecoratedBox(
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withValues(alpha: 0.03),
                    ),
                  ),
                  itemCount: 12 * 30,
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 12,
            right: 12,
            child: SafeArea(
              bottom: false,
              child: TopNavBar(
                personName: PortfolioData.personName,
                themeController: widget.themeController,
                onNavigate: _navigate,
              ),
            ),
          ),
          ScrollProgressIndicator(controller: _scrollController),
          SingleChildScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            child: Column(
              children: [
                KeyedSubtree(
                  key: _heroKey,
                  child: HeroSection(
                    onContact: () => _scrollTo(_contactKey),
                    onDownloadCv: _downloadCv,
                    onViewProjects: () => _scrollTo(_projectsKey),
                    width: width,
                  ),
                ),
                KeyedSubtree(
                  key: _aboutKey,
                  child: AboutSection(width: width),
                ),
                KeyedSubtree(
                  key: _skillsKey,
                  child: SkillsSection(width: width),
                ),
                KeyedSubtree(
                  key: _experienceKey,
                  child: ExperienceSection(width: width),
                ),
                KeyedSubtree(
                  key: _projectsKey,
                  child: ProjectsSection(width: width),
                ),
                KeyedSubtree(
                  key: _servicesKey,
                  child: ServicesSection(width: width),
                ),
                KeyedSubtree(
                  key: _contactKey,
                  child: ContactSection(width: width),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
          const Positioned(
            right: 14,
            bottom: 14,
            child: SocialFab(
              githubUrl: PortfolioData.github,
              linkedInUrl: PortfolioData.linkedIn,
              telegramUrl: PortfolioData.telegram,
              whatsappUrl: PortfolioData.whatsapp,
            ),
          )
        ],
      ),
    );
  }
}
