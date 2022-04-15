class Organization {
  final String id;
  final String userId;
  final String name;
  final String email;
  final String cnpj;
  final String description;
  final String sector;
  final String avatarUrl;
  final String method;
  final bool hasExperienceWithAgile;

  const Organization({
    required this.id,
    required this.userId,
    required this.name,
    required this.email,
    required this.cnpj,
    required this.description,
    required this.sector,
    required this.avatarUrl,
    required this.method,
    required this.hasExperienceWithAgile,
  });
}