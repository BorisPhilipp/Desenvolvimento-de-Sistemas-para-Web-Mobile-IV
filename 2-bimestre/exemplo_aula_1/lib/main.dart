import 'package:flutter/material.dart';
import 'package:exemplo_aula_1/providers/task_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tarefas',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const TaskListPage()
    );
  }
}

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});


  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final TextEditingController taskController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Tarefas"),
      ),
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: taskController,
                  decoration: InputDecoration(labelText: 'Nova Tarefa', border: OutlineInputBorder() ),
                ),
              ),
              IconButton(icon: Icon(Icons.add),
              onPressed: (){
                if (taskController.text.isNotEmpty){
                  taskProvider.addTask((taskController.text));
                  taskController.clear();
                }
              }
              )
            ])),
            Expanded(child: ListView.builder(
              itemCount: taskProvider.tasks.length,
              itemBuilder: (context, index){
                final task = taskProvider.tasks[index];
                return ListTile(
                  leading: Checkbox(
                  value: task.isCompleted,
                  onChanged: (value){
                    taskProvider.completarTarefa(task.id);
                  },
                ),
                title: Text(
                  task.titulo,
                  style: TextStyle(
                    decoration: task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: (){
                    taskProvider.deleteTask(task.id);
                  },
                ),
                );
              },
            ))
        ]));
  }
}