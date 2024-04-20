class Statement {
    String id;
    String actor;
    String action;
    String context;
    String object;

    Statement({required this.id,required this.actor,required this.action,required this.context,required this.object});

    factory Statement.fromJson(Map<String, dynamic> json) {
        return Statement(
            id: json['_id'],
            actor: json['actor'],
            action: json['action'],
            context: json['context'],
            object: json['object'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['_id'] = id;
        data['actor'] = actor;
        data['action'] = action;
        data['context'] = context;
        data['object'] = object;
        return data;
    }
}