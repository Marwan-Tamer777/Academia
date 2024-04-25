class Role {
    String courseId;
    String roleName;
    int roleCode;
    int level;
    List<String> privileges;
    String description;

    Role({required this.courseId,required this.roleName,required this.roleCode,required this.level,required this.privileges,required this.description});

    factory Role.fromJson(Map<String, dynamic> json) {
        return Role(
            courseId: json['courseId'],
            roleName: json['roleName'],
            roleCode: json['roleCode'],
            level: json['level'],
            privileges: json['privileges'],
            description: json['description'],
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'courseId': courseId,
            'roleName': roleName,
            'roleCode': roleCode,
            'level': level,
            'privileges': privileges,
            'description': description,
        };
    }
}