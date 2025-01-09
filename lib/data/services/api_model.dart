import 'package:http/http.dart' as http;

class ApiModel {
  Future<http.Response> get({
    required String uri,
    String? authorization,
  }) async {
    final response = await http.get(Uri.parse(uri), headers: {
      "Content-Type": "application/json",
      "Authorization": authorization!
    });
    return response;
  }

  
  Future<http.Response> post({
    required String uri,
    String? authorization,
    Object? body
  }) async {
    final response = await http.post(Uri.parse(uri), headers: {
      "Content-Type": "application/json",
      "Authorization": authorization!
    }, body: body,);
    return response;
  }
  Future<http.Response> put({
    required String uri,
    String? authorization,
    Object? body
  }) async {
    final response = await http.put(Uri.parse(uri), headers: {
      "Content-Type": "application/json",
      "Authorization": authorization!
    }, body: body,);
    return response;
  }
  Future<http.Response> delete({
    required String uri,
    String? authorization,
    
  }) async {
    final response = await http.delete(Uri.parse(uri), headers: {
      "Content-Type": "application/json",
      "Authorization": authorization!
    },);
    return response;
  }
}
