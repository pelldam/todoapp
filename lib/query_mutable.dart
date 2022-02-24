class QueryMutation {
String? developer_id="";
String addTodo(){
return r''' 

mutation InsertTask($description: String!, $developer_id: String!, $title: String!) {
  insert_tasks_one(object: {title: $title, developer_id: $developer_id, description: $description}) {
    created_at
    description
    developer_id
    id
    isCompleted
    title
    updated_at
  }
}


''';


}


String editTodo(){

  return r'''
mutation UpdateTask($payload: tasks_set_input = {}, $id: uuid!) {
  update_tasks_by_pk(pk_columns: {id: $id}, _set: $payload) {
    created_at
    description
    developer_id
    id
    isCompleted
    title
    updated_at
  }
}

 ''';
}

String deleteTodo(){


  return r'''
mutation DeleteTask($id: uuid = "") {
  delete_tasks_by_pk(id: $id) {
    id
    developer_id
    description
    created_at
    isCompleted
    title
    updated_at
  }
}




 ''';
}

String getAllList(){

return r'''
query GetAllTasks($developer_id: String!) {
  tasks(where: {developer_id: {_eq: $developer_id}}) {
    id
    developer_id
    description
    created_at
    isCompleted
    title
    updated_at
  }
}
''';


}


String getSingleTask(){


  return r'''
query GetSingleTask($id: uuid!) {
  tasks_by_pk(id: $id) {
    created_at
    description
    developer_id
    id
    isCompleted
    title
    updated_at
  }
}


 ''';
}





}