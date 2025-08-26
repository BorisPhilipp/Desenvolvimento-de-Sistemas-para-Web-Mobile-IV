import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meu_projeto_integrador/models/todo_model.dart';

class TodoService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/';

  Future<List<Todo>> fetchTodos() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/todos'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        return jsonList.map((json) => Todo.fromJson(json)).toList();
      } else {
        throw Exception('Falha ao carregar todos: ${response.statusCode}');
      }
    } on http.ClientException catch (e) {
      throw Exception('Erro de conexão.');
    } catch (e) {
      throw Exception('Erro Inexperado: $e');
    }
  }

  Future<Todo> createTodo(Todo todo) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/todos'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(todo.toJson()),
      );

      if (response.statusCode == 201) {
        return Todo.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Falha ao criar a tarefa');
      }
    } catch (e) {
      throw Exception('Falha ao criar a tarefa, $e');
    }
  }
}
