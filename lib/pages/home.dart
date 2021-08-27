import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String? _userToDo;
  List todoList = [];
  List doneList = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    todoList.addAll(['Wake up', 'Wash dishes', 'Buy milk', 'Go for walk', 'Buy water', 'русское дело', 'Погулять', 'Доделать дизайн приложения', 'Cоздать аккаут в Apple']);
    todoList.addAll(['Wake up', 'Wash dishes', 'Buy milk', 'Go for walk', 'Buy water', 'русское дело', 'Погулять', 'Доделать дизайн приложения', 'Cоздать аккаут в Apple']);
    todoList.addAll(['Wake up', 'Wash dishes', 'Buy milk', 'Go for walk', 'Buy water', 'русское дело', 'Погулять', 'Доделать дизайн приложения', 'Cоздать аккаут в Apple']);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, 
        child: Scaffold(
          body: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              floating: true,
              snap: true,
              flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
                children: [TabBar(tabs: [Tab(text: 'Новые',), Tab(text: 'Выполненные',)])],
              ),
            ),
          ],
          body: TabBarView(
            children: [
              Scaffold( // возвращает некий слой
                backgroundColor: Colors.grey[300],
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
                          Icons.done_outline_rounded,
                          color: Colors.green,
                        ),
                        onPressed: () {setState(() {
                          doneList.add(todoList[index]);
                          todoList.removeAt(index);
                        }
                        );
                        }, // действие аналогичное, но уже при нажатии на кнопку
                      ),
                    ),
                  ),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) // обрабатываем, что произойдет с объектом при свайпе
                  {setState(() {
                    doneList.add(todoList[index]);
                    todoList.removeAt(index);});},
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
              ),
              // НАЧИНАЕТСЯ БЛОК "ВЫПОЛНЕННЫЕ"
              Scaffold( // возвращает некий слой
                backgroundColor: Colors.grey[300],
                body: ListView.builder( // ListView позволяет создавать объекты в формате списка
                    itemCount: doneList.length, // длина массива/списка
                    itemBuilder: (BuildContext context, int index) // перебирает полностью весь список
                    {
                      return Dismissible( // формирует блок, в котором будут выводиться элементы массива todo_list, который можно удалить свайпом
                        key: Key(doneList[index]), // берем элемент списка по ключу
                        child: Card( // в теле блока выводим карочку (некий блок, в котором мы можем вывести информацию)
                          child: ListTile( // которая содержит ListTile (есть также ListBody) с текстом элемента массива, взятого по ключу
                            title: Text(doneList[index]),
                            trailing: IconButton( // добавляем иконку-кнопку, чтобы удалять не только свайпом
                              icon: Icon(
                                Icons.delete_sweep,
                                color: Colors.grey,
                              ),
                              onPressed: () {setState(() {doneList.removeAt(index);});}, // действие аналогичное, но уже при нажатии на кнопку
                            ),
                          ),
                        ),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) // обрабатываем, что произойдет с объектом при свайпе
                        {setState(() {doneList.removeAt(index);});},
                      );
                    }
                ),
              ),
      ],
    ),
    ),
    ),
    );
  }
}