import 'package:d_my_task/widgets/delete_button.dart';
import 'package:d_my_task/pages/input_task.dart';
import 'package:d_my_task/widgets/desc_new_task.dart';
import 'package:d_my_task/widgets/header.dart';
import 'package:d_my_task/widgets/list_task.dart';
import 'package:d_my_task/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  List<String> time;
  List<String> titleTask;
  List<String> typeTask;

  MainPage({this.titleTask, this.typeTask, this.time});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() { 
    super.initState();
    loadData();
  }

  void saveData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.setStringList('title', widget.titleTask);
      pref.setStringList('type', widget.typeTask);
      pref.setStringList('time', widget.time);
    });
  }

  void loadData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      widget.titleTask = pref.getStringList('title') ?? [];
      widget.typeTask = pref.getStringList('type') ?? [];
      widget.time = pref.getStringList('time') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.blue[400],
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return InputTask(
                  listTitle: widget.titleTask,
                  listType: widget.typeTask,
                  listTime: widget.time,
                );
              }));
            },
            tooltip: 'Menambahkan Kegiatan',
            child: Icon(
              Icons.add,
            ),
          ),
          SizedBox(
            width: 30,
          ),
          FloatingActionButton(
            tooltip: 'Refresh Halaman',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Berhasil di Refresh',
                    textAlign: TextAlign.center,
                  ),
                  duration: Duration(seconds: 2),
                ),
              );
              saveData();
            },
            child: Icon(Icons.refresh),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(),
                SizedBox(height: 30),
                TitleText(
                  text: 'New Task',
                ),
                SizedBox(
                  height: 10,
                ),
                DescNewTask(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitleText(
                      text: 'My Task',
                    ),
                    InkWell(
                      onTap: () {
                        widget.titleTask.removeLast();
                        widget.time.removeLast();
                        widget.typeTask.removeLast();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Data Dihapus',
                              textAlign: TextAlign.center,
                            ),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        setState(() {});
                      },
                      child: DeleteButton(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ListTask(
                  titleTask: widget.titleTask,
                  typeTask: widget.typeTask,
                  time: widget.time,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
