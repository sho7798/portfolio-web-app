import 'package:flutter/material.dart';

class ExperienceItem {
  const ExperienceItem({
    required this.company,
    required this.position,
    required this.duration,
    required this.responsibilities,
    required this.achievements,
    required this.technologies,
    required this.isPrimaryStack,
  });

  final String company;
  final String position;
  final String duration;
  final List<String> responsibilities;
  final List<String> achievements;
  final List<String> technologies;
  final bool isPrimaryStack;
}

class ProjectItem {
  const ProjectItem({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.technologies,
    required this.features,
    required this.githubUrl,
    this.liveUrl,
    required this.gradient,
    required this.icon,
  });

  final String id;
  final String name;
  final String category;
  final String description;
  final List<String> technologies;
  final List<String> features;
  final String githubUrl;
  final String? liveUrl;
  final LinearGradient gradient;
  final IconData icon;
}

class ServiceItem {
  const ServiceItem({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;
}

class SkillGroup {
  const SkillGroup({
    required this.title,
    required this.items,
  });

  final String title;
  final List<String> items;
}

class EducationItem {
  const EducationItem({
    required this.institution,
    required this.degree,
    required this.duration,
    required this.description,
  });

  final String institution;
  final String degree;
  final String duration;
  final String description;
}

