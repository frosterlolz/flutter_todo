import 'package:flutter/material.dart';
import 'package:flutter_todo/includes/NavBar.dart';

// stless/stfull создает сразу класс (почитать поподробнее)

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  static const String _title = 'Список дел';

  String? _userToDo;
  List todoList = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    todoList.addAll(['Wake up', 'Wash dishes', 'Buy milk', 'Go for walk']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // возвращает некий слой
      drawer: NavBar(),
      backgroundColor: Colors.grey[300],
      appBar: AppBar(title: const Text(_title), centerTitle: true,), // HEADER
      body: ListView.builder( // ListView позволяет создавать объекты в формате списка
          itemCount: todoList.length, // длина массива/списка
          itemBuilder: (BuildContext context, int index) // перебирает полностью весь список
          {
            return Dismissible( // формирует блок, в котором будут выводиться элементы массива todo_list, который можно удалить свайпом
                key: Key(todoList[index]), // берем элемент списка по ключу
                child: Card( // в теле блока выводим карочку (некий блок, в котором мы можем вывести информацию)
                  child: ListTile( // которая содержит ListTile (есть также ListBody) с текстом элемента массива, взятого по ключу
                    title: Text(todoList[index]),
                    trailing: IconButton( // добавляем иконку-кнопку, чтобы удалять не только свайпом
                      icon: Icon(
                        Icons.delete_sweep,
                        color: Colors.grey,
                      ),
                      onPressed: () {setState(() {todoList.removeAt(index);});}, // действие аналогичное, но уже при нажатии на кнопку
                    ),
                  ),
                ),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) // обрабатываем, что произойдет с объектом при свайпе
            {setState(() {todoList.removeAt(index);});},
            );
          }
      ),
      floatingActionButton: FloatingActionButton( // добавляем кнопку + добавлять записи в массив
        backgroundColor: Colors.lightBlue[700],
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context){ // при нажатии создается поле showDialog, в котором:
            return AlertDialog( // сам элемент AlertDialog
              title: Text('Добавить элемент'),
              content: TextField(
                onChanged: (String value) { // при вводе информации мы помещаем её в поле userToDo
                  _userToDo = value;
                },
              ),
              actions: [ // добавляем кнопки(у) всплывающему окну
                ElevatedButton(onPressed: (){
                  setState(() {
                    todoList.add(_userToDo); // кнопка используя состояние добавляет запись из userToDo в массив todoList
                  });

                  Navigator.of(context).pop(); // закрывает всплывающие окна
                }, child: Text('Добавить'))
              ],
            );
          }); // context - страничка, на которой мы находимся
        },
        child: Icon(
        Icons.add_sharp,
        size: 25,
        color: Colors.white,
        ),
    ),
    );
  }
}






// void _menuOpen(){ // реализуем выезжающее меню
//   Navigator.of(context).push(
//     MaterialPageRoute(builder: (BuildContext context) {
//       return Scaffold(
//           appBar: AppBar(title: Text('Menu'),),
//           body: Row(
//             children: [
//               ElevatedButton(onPressed: ()
//               {
//                 Navigator.pop(context);
//                 Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
//               },
//                   child: Text('На главную')),
//             ElevatedButton(onPressed: (){}, child: Text('пустышка')),
//             ElevatedButton(onPressed: (){
//               Navigator.pop(context);
//               Navigator.pushReplacementNamed(context, '/profile');
//             }, child: Text('Профиль')),
//             // можно добавить еще кнопок
//             Padding(padding: EdgeInsets.only(left:15)),
//           ],
//         )
//       );
//     })
//   );
// }