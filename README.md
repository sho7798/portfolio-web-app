# Portfolio App

A responsive Flutter portfolio application designed to showcase professional skills, experience, education, services, and portfolio projects.

## Overview

This project is a polished portfolio landing page built with Flutter. It includes:

- A hero section with quick introduction and CTA buttons
- About section for personal summary and strengths
- Skills section with grouped technical skills
- Experience section with timeline-style project work
- Education section highlighting academic background
- Portfolio projects section featuring app concepts like:
  - Travel Social App
  - Fitness Inhouse App
  - Media Streaming App with multiple player support
  - Single-property Hotel Booking App
- Services section with core consulting and development offerings
- Contact section and social action buttons

## Features

- Responsive UI for desktop, tablet, and mobile screens
- Light / dark theme support
- Smooth scroll navigation with page anchors
- Glassmorphism-style content cards
- Social and contact links using `url_launcher`
- Local theme persistence via `shared_preferences`

## App Structure

- `lib/main.dart` — app entry point
- `lib/app/portfolio_app.dart` — root application shell and theme setup
- `lib/features/portfolio/data/portfolio_data.dart` — portfolio content and project data
- `lib/features/portfolio/domain/models.dart` — portfolio item models
- `lib/features/portfolio/presentation/pages/portfolio_page.dart` — main page scaffold
- `lib/features/portfolio/presentation/widgets/` — section widgets for hero, about, skills, experience, projects, services, and contact

## Installation

1. Install Flutter from https://flutter.dev if it is not already installed.
2. Open the project in your editor.
3. Get dependencies:

```bash
flutter pub get
```

## Run

Run the app on a connected device, emulator, or simulator:

```bash
flutter run
```

To target a specific device:

```bash
flutter run -d <device-id>
```

## Notes

- The portfolio content is driven by `PortfolioData`; update that file to customize project names, personal details, links, and section text.
- The current education entry is set to `University of Computer Studies, Yangon`.

## Dependencies

- `flutter`
- `shared_preferences`
- `url_launcher`

## License

This repository is provided as-is for portfolio demonstration purposes.
