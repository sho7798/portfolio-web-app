import 'package:flutter/material.dart';
import 'package:portfolio_app/features/portfolio/domain/models.dart';

class PortfolioData {
  static const String personName = 'Su Hlaing Oo';
  static const String personRole =
      'Flutter Developer | Former React Native Developer';
  static const String intro =
      'Experienced mobile developer focused on clean, performance, cross-platform apps. Flutter-first now, with a React Native foundation and a passion for polished UI.';

  static const String email = 'you@example.com';
  static const String github = 'https://github.com/your-username';
  static const String linkedIn = 'https://www.linkedin.com/in/your-username/';
  static const String telegram = 'https://t.me/your_username';
  static const String whatsapp = 'https://wa.me/your_number';

  static const String downloadCvUrl = 'https://example.com/your-cv.pdf';

  static const List<String> heroStats = [
    'Mobile Apps Delivered',
    'Flutter & Dart Focus',
    'Clean Architecture'
  ];

  static final List<SkillGroup> skillGroups = [
    const SkillGroup(
      title: 'Flutter Skills',
      items: [
        'Flutter',
        'Dart',
        'Firebase',
        'REST API',
        'Clean Architecture',
        'GetX / Bloc / Provider',
        'SQLite / Hive',
        'Responsive UI',
        'Animations',
        'Android & iOS Development',
      ],
    ),
    const SkillGroup(
      title: 'React Native Background',
      items: [
        'React Native',
        'JavaScript / TypeScript',
        'API Integration',
        'Cross-platform Development',
      ],
    ),
    const SkillGroup(
      title: 'Tools',
      items: [
        'Git & GitHub',
        'VS Code',
        'Android Studio',
        'Figma',
      ],
    ),
  ];

  static const List<ExperienceItem> experiences = [
    ExperienceItem(
      company: 'Oriental Vigour Co.Ltd',
      position: 'React Native Developer',
      duration: '~2 years',
      responsibilities: [
        'Built cross-platform features using React Native and JavaScript',
        'Implemented robust API integration patterns',
        'Collaborated on scalable codebase structure and UI consistency',
      ],
      achievements: [
        'Shipped multiple production releases with stable performance',
        'Improved developer productivity via reusable component patterns',
      ],
      technologies: [
        'React Native',
        'JavaScript',
        'REST APIs',
        'State Management',
        'Cross Platform'
      ],
      isPrimaryStack: false,
    ),
    ExperienceItem(
      company: 'Oriental Vigour Co.Ltd',
      position: 'Flutter Developer',
      duration: '3+ years',
      responsibilities: [
        'Develop Flutter apps with modular, maintainable architecture',
        'Built responsive UI systems and smooth animations',
        'Integrated Firebase, local storage, and platform-specific features',
      ],
      achievements: [
        'Delivered clean, user-friendly UI with improved perceived performance',
        'Established scalable patterns for features and app navigation',
        'Payment Integration'
      ],
      technologies: [
        'Flutter',
        'Dart',
        'Firebase',
        'REST APIs',
        'State Managements',
        'Sqflite / Hive / Realm',
        'Responsive UI',
        'Android & IOS Development',
        'Clean Architecture',
      ],
      isPrimaryStack: true,
    ),
  ];

  static const List<EducationItem> educations = [
    EducationItem(
      institution: 'University of Computer Studies, Yangon',
      degree: 'B.C.Sc',
      duration: 'Graduated',
      description: 'Focused on software development, algorithms, and systems.',
    ),
  ];

  static final List<ProjectItem> projects = [
    const ProjectItem(
      id: 'travel_social',
      name: 'Travel Social App',
      category: 'Social / Travel',
      description:
          'A community-driven travel app for sharing trips, itineraries, photos, and connecting with other travelers.',
      technologies: [
        'Flutter',
        'Dart',
        'Firebase(Push Notification)',
        'REST APIs'
      ],
      features: [
        'User profiles and follow system',
        'Post feeds with photo galleries',
        'Trip creation and collaborative itineraries',
        'In-app messaging and notifications'
      ],
      githubUrl: 'https://github.com/your-username/travel-social-app',
      liveUrl: null,
      gradient: LinearGradient(
        colors: [Color(0xFF00A3FF), Color(0xFF5B8CFF)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      icon: Icons.travel_explore,
    ),
    const ProjectItem(
      id: 'fitness_inhouse',
      name: 'Fitness App',
      category: 'Health & Fitness',
      description:
          'An in-house fitness app for gyms and trainers to manage classes, member progress, and deliver guided workouts.',
      technologies: [
        'Flutter',
        'Dart',
        'REST APIs',
        'Firebase(Push Notification)'
      ],
      features: [
        'Class schedules and bookings',
        'Workout plans with progress tracking',
        'Video-guided exercises and timers',
        'Trainer dashboards and member notes'
      ],
      githubUrl: 'https://github.com/your-username/fitness-inhouse-app',
      liveUrl: null,
      gradient: LinearGradient(
        colors: [Color(0xFF00C48C), Color(0xFF00D4FF)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      icon: Icons.fitness_center,
    ),
    const ProjectItem(
      id: 'media_streaming',
      name: 'Media Streaming App',
      category: 'Media & Streaming',
      description:
          'A media player app supporting multiple player backends and adaptive streaming for audio and video content.',
      technologies: [
        'Flutter',
        'Dart',
        'video_player',
        'Firebase(Push Notification)',
        'Adaptive streaming (HLS/Drive)',
        'Payment Gateway'
      ],
      features: [
        'Multiple player integrations (audio & video)',
        'Background playback and playlists',
        'Adaptive bitrate streaming support',
        'Cast / AirPlay integration planning'
      ],
      githubUrl: 'https://github.com/your-username/media-streaming-app',
      liveUrl: null,
      gradient: LinearGradient(
        colors: [Color(0xFF8A5BFF), Color(0xFFFF5B8D)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      icon: Icons.play_circle_filled,
    ),
    const ProjectItem(
      id: 'hotel_single',
      name: 'Hotel Booking — Single Property',
      category: 'Business',
      description:
          'A focused booking app tailored for a single hotel property with custom room types, availability, and promotions.',
      technologies: [
        'Flutter',
        'Dart',
        'REST APIs',
        'Stripe / Payment Gateway'
      ],
      features: [
        'Room browsing with real-time availability',
        'Reservation flow and confirmation',
        'Promo codes and special offers',
        'Property information and contact support'
      ],
      githubUrl: 'https://github.com/your-username/hotel-single-property',
      liveUrl: null,
      gradient: LinearGradient(
        colors: [Color(0xFFFFB020), Color(0xFF5B8CFF)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      icon: Icons.hotel,
    ),
  ];

  static const List<ServiceItem> services = [
    ServiceItem(
      title: 'Flutter App Development',
      description:
          'End-to-end Flutter builds with scalable architecture and responsive UI.',
      icon: Icons.phone_android,
    ),
    ServiceItem(
      title: 'Cross-platform Mobile Development',
      description:
          'Build consistent experiences across Android and iOS with polished UX.',
      icon: Icons.mobile_friendly,
    ),
    ServiceItem(
      title: 'UI Implementation',
      description:
          'Clean UI, animations, and reusable components that feel premium.',
      icon: Icons.design_services,
    ),
    ServiceItem(
      title: 'API Integration',
      description:
          'Reliable REST API integration with maintainable state and flows.',
      icon: Icons.api,
    ),
    ServiceItem(
      title: 'Firebase Integration',
      description:
          'Auth, realtime data, notifications, and Firebase-backed features.',
      icon: Icons.cloud,
    ),
    ServiceItem(
      title: 'App Maintenance',
      description:
          'Keep apps fast, stable, and up to date with ongoing improvements.',
      icon: Icons.update,
    ),
    ServiceItem(
      title: 'Bug Fixing',
      description:
          'Diagnose and resolve issues quickly with careful testing and fixes.',
      icon: Icons.bug_report,
    ),
    ServiceItem(
      title: 'Responsive Mobile UI',
      description:
          'Layouts that adapt smoothly to any screen size and orientation.',
      icon: Icons.screen_rotation_alt,
    ),
  ];
}
