import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
part 'main.g.dart';

late Box<Task> taskBox; // to be global

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  // Opens the Hive box for tasks (where the to-do list items are stored)
  taskBox = await Hive.openBox<Task>('tasks'); // the hive box is named 'tasks'
  runApp(const MyApp());
}

@HiveType(typeId: 1)
class Task {
  @HiveField(0)
  String name;
  @HiveField(1)
  bool isdone = false;
  Task({required this.name});
}

// then stage and commit then push to remote
// then switch to main branch then
// then git pull origin main then merge
// then push to master
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'To-Do List',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(195, 6, 250, 67),
          ),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const MyHomePage(),
          '/tasks': (context) => const TasksPage()
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('To-Do List'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "What Needs to Be Done?",
              style: TextStyle(
                color: Colors.green,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 75.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              child: TextField(
                autofocus: false,
                controller: _controller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 2.0,
                    ),
                  ),
                  hintText: 'Enter a task',
                  hintStyle: const TextStyle(color: Colors.grey),
                  labelText: 'Task',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  icon: const Icon(Icons.task),
                  iconColor: Colors.green,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 2.0,
                    ),
                  ),
                  labelStyle: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  taskBox.add(Task(name: _controller.text));
                  _controller.clear();
                  // this down to close the keyboard after pressing
                  //FocusScope.of(context).requestFocus(FocusNode());
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Task added!")),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                      "Please enter a task!", 
                     )),
                  );
                }
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              label: const Text(
                'Add Task',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                  const Color.fromARGB(195, 6, 250, 67),
                ),
              ),
            ),
            Padding(
              // you can use a stack and positioned to make the button go down more
              padding: const EdgeInsets.only(top: 70.0, right: 20.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton.small(
                  backgroundColor: const Color.fromARGB(195, 6, 250, 67),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Settings Menu'),
                              IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Closes the dialog
                                },
                              ),
                            ],
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: const Icon(Icons.account_circle),
                                title: const Text('Auto Close Keyboard after adding task'),
                                onTap: () {
                                  Navigator.of(context).pop();
                                  print("Profile selected");
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.notifications),
                                title: const Text('Show Task Added After entering a task'),
                                onTap: () {
                                  Navigator.of(context).pop();
                                  print("Notifications selected");
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.settings),
                                title: const Text('Dark Theme'),
                                onTap: () {
                                  Navigator.of(context).pop();
                                  print("Settings selected");
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 150, 255, 150),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Tasks',
            )
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              if (index == 0) {
                Navigator.pushNamed(context, '/');
              } else if (index == 1) {
                Navigator.pushNamed(context, '/tasks');
              }
            });
          }),
    );
  }
}

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('To-Do List'),
          centerTitle: true,
        ),
        body: ValueListenableBuilder(
          valueListenable:
              taskBox.listenable(), // This listens to changes in the box
          builder: (context, Box<Task> box, _) {
            // 'box' is the current state of the Box
            if (box.isEmpty) {
              return const Center(
                child: Text(
                  'No tasks available. Add some!',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: box
                    .length, // box is passed to the builder and represents the taskBox
                itemBuilder: (context, index) {
                  final task =
                      box.getAt(index); // Fetches the task at the current index
                  return TaskWidget(task: task!, index: index);
                },
              );
            }
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color.fromARGB(255, 150, 255, 150),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Tasks',
              )
            ],
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                if (index == 0) {
                  Navigator.pushNamed(context, '/');
                } else if (index == 1) {
                  Navigator.pushNamed(context, '/tasks');
                }
              });
            }));
  }
}

class TaskWidget extends StatelessWidget {
  final Task task;
  final int index;

  const TaskWidget({super.key, required this.task, required this.index});

  void _deleteTask(BuildContext context) {
    final taskBox = Hive.box<Task>('tasks');
    taskBox.deleteAt(index); // Delete task at the given index
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Task finished!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.name),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          _deleteTask(context);
        },
      ),
    );
  }
}
