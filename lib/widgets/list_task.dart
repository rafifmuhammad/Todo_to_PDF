import 'package:flutter/material.dart';

class ListTask extends StatefulWidget {
  ListTask({
    Key key,
    @required this.titleTask,
    @required this.typeTask,
    @required this.time,
  }) : super(key: key);

  List<String> titleTask;
  List<String> typeTask;
  List<String> time;

  @override
  _ListTaskState createState() => _ListTaskState();
}

class _ListTaskState extends State<ListTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: (widget.titleTask.isEmpty)
          ? Container(
            child: Image.asset(
              'images/todo.png',
            ),
          )
          : ListView.separated(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Task #${index + 1}',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 5, 15, 5),
                                decoration: BoxDecoration(
                                  color: Colors.green[100],
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Text(
                                  widget.typeTask[index],
                                  style: TextStyle(color: Colors.green),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            widget.titleTask[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.attachment,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                widget.time[index],
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
              itemCount: widget.titleTask.length,
            ),
    );
  }
}
