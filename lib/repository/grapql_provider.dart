import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';

// String? uuidFromObject(Object? object) {
//   if (object is Map<String, Object>) {
//     final String typeName = object['__typename']!;
//     final String id = object['id'].toString();
//     if (typeName != null && id != null) {
//       return <String>[typeName, id].join('/');
//     }
//   }
//   return null;
// }


Future<GraphQLClient> clientToQuery() async{
   await initHiveForFlutter();
  final HttpLink httpLink = HttpLink(
    'https://todolistassessment.hasura.app/v1/graphql',
    defaultHeaders: {
   "x-hasura-admin-secret": "JG7vDm15n1fVT2QhwYNyDFJJmm5iQKIea3H0tVpYnNV735Wa2ms3msthBGquM2sm",
"content-type": "application/json"
    }
  );
return GraphQLClient(

cache: GraphQLCache(),

link: httpLink,

);

}