final String tableUser = 'user';

class UserFields {
  static final String id = '_id';
  static final String role = 'role';
  static final String name = 'name';
}


class User {
  final int? id;
  final int role; // 0 -- user, 1 -- volunteer
  final String name;
  // location 

  const User({
    this.id,
    required this.role,
    required this.name,
  });

  User copy({
    int? id,
    int? role,
    String? name,
  }) =>
      User(
        id: id ?? this.id,
        role: role ?? this.role,
        name: name ?? this.name,
      );

  Map<String, Object?> toJson() => {
    UserFields.id: id,
    UserFields.role: role,
    UserFields.name: name,
  };
  
}

