class User {
    String? name;
    String? email;
    String? password;
    bool? isAdmin;
    String? avatar;
    String? assignedId;
    List<String>? courses;
    String? lastAccessedCourse;
    List<String>? contacts;
    String? description;
    String? title;
    String? department;
    String? createdOn;
    String? editedOn;

    User({required this.name,required this.email,required this.password,required this.isAdmin,required this.avatar,required this.assignedId,required this.courses,required this.lastAccessedCourse,required this.contacts,required this.description,required this.title,required this.department,required this.createdOn,required this.editedOn});

    User.fromJson(Map<String, dynamic> json) {
        name = json['name'];
        email = json['email'];
        password = json['password'];
        isAdmin = json['isAdmin'];
        avatar = json['avatar'];
        assignedId = json['assignedId'];
        courses = json['courses'].cast<String>();
        lastAccessedCourse = json['lastAccessedCourse'];
        contacts = json['contacts'].cast<String>();
        description = json['description'];
        title = json['title'];
        department = json['department'];
        createdOn = json['createdOn'];
        editedOn = json['editedOn'];
    }
    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['name'] = name;
        data['email'] = email;
        data['password'] = password;
        data['isAdmin'] = isAdmin;
        data['avatar'] = avatar;
        data['assignedId'] = assignedId;
        data['courses'] = courses;
        data['lastAccessedCourse'] = lastAccessedCourse;
        data['contacts'] = contacts;
        data['description'] = description;
        data['title'] = title;
        data['department'] = department;
        data['createdOn'] = createdOn;
        data['editedOn'] = editedOn;
        return data;
    }
}