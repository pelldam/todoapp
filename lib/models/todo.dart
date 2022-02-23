class Todo{

String? id;
DateTime? createdAt;
DateTime? updateAt;
String? title;
String? description;
bool? isCompleted;
String? developerId;
Todo({
this.id,
this.createdAt,
this.updateAt,
this.title,
this.description,
this.isCompleted,
this.developerId,
});
factory Todo.fromJson(Map<String,dynamic>json)=>Todo(
id: json['id'],
createdAt: DateTime.parse(json['created_at']),
updateAt: DateTime.parse(json['updated_at']),
title: json['title'],
description: json['description'],
isCompleted: json['isCompleted'],
developerId: json['developer_id']

);


}