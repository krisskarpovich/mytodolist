
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  // в самом начале мы создаём класс, который наследуется от стэйтфулвиджет
  //это значит, что данный виджет может изменять своё состояние
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
  //тот метод обязателен для любого класса, который наследуется
// от StatefulWidget. Его задача — создать и вернуть экземпляр
// класса, который будет управлять состоянием виджета.
//_HomeState(): Это конструктор класса состояния, который создаётся для виджета Home.
// Этот класс отвечает за логику и данные, которые изменяются во время работы виджета. Виджет может перерисовываться, когда изменяется его состояние.
//
// Класс _HomeState — это частный класс (начинается с подчёркивания _),
// что означает, что он используется только внутри данного файла и недоступен извне.
}

class _HomeState extends State<Home> {

  List todoList = [];
  String userTodo = '';

  @override
  void initState() {
    super.initState();
  }

  List <String> lines = ['buy milk', 'study', 'swim', 'teach'];
  List <String> companies = ['mac', 'beefree', 'swim', 'teach'];


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('Мой список дел'),
        backgroundColor: Colors.pink,
        centerTitle: true,

      ),
      body:

      ListView.builder(
          itemCount: lines.length,

          itemBuilder: (BuildContext context, int index) {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Dismissible(

                        key: Key(lines[index]),
                        onDismissed: (direction) {
                          // if (direction == DismissDirection.endToStart)
                          setState(() {
                            todoList.removeAt(index);
                          });
                        },


                        child:
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(10), // Внутренние отступы
                          margin: EdgeInsets.symmetric(vertical: 5), // Отступы между элементами списка
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black, // Цвет границы
                              width: 2, // Толщина границы
                            ),
                            borderRadius: BorderRadius.circular(10), // Скругленные углы
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(lines[index], style: TextStyle(fontSize: 22)),
                              SizedBox(height: 5), // Отступ между текстами
                              Text("Место работы: ${companies[index]}", style: TextStyle(fontSize: 18)),
                            ],
                          ),
                        )
                    ),
                  ],
                )
            );
          }

      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            String? newTask = await showDialog<String>(
              context: context,
              builder: (BuildContext context) {
                TextEditingController taskController = TextEditingController();
                return AlertDialog(
                  title: Text("Добавить новую задачу"),
                  content: TextField(
                    controller: taskController,
                    decoration: InputDecoration(hintText: "Введите задачу"),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text("Отмена"),
                      onPressed: () {
                        Navigator.of(context).pop();  // Закрыть диалог без добавления
                      },
                    ),
                    TextButton(
                      child: Text("Добавить"),
                      onPressed: () {
                        Navigator.of(context).pop(taskController.text);  // Возврат введённого текста
                      },
                    ),
                  ],
                );
              },
            );

            if (newTask != null && newTask.isNotEmpty) {
              setState(() {
                lines.add(newTask);  // Добавляем новую задачу в список
                companies.add("Новая компания");  // Или любые сопутствующие данные
              });
            }
          }
      ),





    );

  }
}
