class Tabs {
  final String name;
  final String key;

  const Tabs({
    required this.name,
    required this.key,
  });
}

final List<Tabs> tabs = [
  const Tabs(name: "VIEW ALL", key: "view_all"),
  const Tabs(name: "DRESSES", key: "dresses"),
  const Tabs(name: "JACKETS", key: "jackets"),
  const Tabs(name: "ELECTRONICS", key: "electronics"),
];
