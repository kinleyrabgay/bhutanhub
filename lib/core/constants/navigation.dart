import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Navigations {
  final String label;
  final IconData icon;

  const Navigations({
    required this.label,
    required this.icon,
  });
}

final List<Navigations> navigations = [
  const Navigations(label: "Home", icon: Iconsax.home),
  const Navigations(label: "Service", icon: Iconsax.magicpen),
  const Navigations(label: "Search", icon: Iconsax.search_normal),
  const Navigations(label: "Profile", icon: Iconsax.user),
];
