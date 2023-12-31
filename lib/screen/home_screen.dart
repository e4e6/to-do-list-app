import'package:flutter/material.dart';
import 'package:test_1/data/model/todo_info_model.dart';

import'../data/functions/todo_functions.dart';
import'input_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var todoFunctions=TodoFunctions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('To Do List'),
          backgroundColor: Colors.black87,
        ),

        body: ListView.builder(
          itemCount: todoFunctions.todoInfoData.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Container(
                  color: todoFunctions.todoInfoData[index].isDone
                      ? Colors.blueGrey
                      : Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          child: Container(
                          height: 70,
                          padding:const EdgeInsets.fromLTRB(10, 0, 100, 0),
                          alignment: Alignment.center,
                          child: Text(todoFunctions.todoInfoData[index].name),
                        ),
                        onTap: () {
                          setState((){
                          todoFunctions.changeTodoInfoIsDone(index: index);},
                          );
                        }
                      ),
                      IconButton(
                          padding:const EdgeInsets.fromLTRB(10, 0, 50, 0),
                          onPressed:(){
                            setState(() {
                            todoFunctions.removeTodoInfoData(index: index);
                          });

                          },
                          icon:const Icon(Icons.delete)
                      ),
                    ],
                  ),
                ),
                Container(
                  height:1,
                  color:Colors.black87
                )
              ],
            );
          },
        ),

        floatingActionButton: InkWell(
          child: FloatingActionButton(
            onPressed: () async {
              final result = await Navigator.of(context).push(MaterialPageRoute(
               builder: (BuildContext context) => const InputScreen(),
                ));
                setState(() {
                  todoFunctions.addTodoInfo(todoInfoModel: TodoInfoModel(result, false));
                });
                },


              child: const Icon(Icons.plus_one_rounded),
          ),
        ),
    );
  }
}
