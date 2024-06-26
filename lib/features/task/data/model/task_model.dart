class TaskModel {
  final String title;
  final String startTime;
  final String endTime;
  final String note;
  final bool isCompleted;
  final int colorId;
  final String id;

  TaskModel(
      {required this.title,
      required this.startTime,
      required this.endTime,
      required this.note,
      required this.isCompleted,
      required this.colorId,
      required this.id});

  static List<TaskModel> tasksList = [
    TaskModel(
        title: "Flutter",
        startTime: "09:00 AM",
        endTime: "10:00 AM",
        note: "Course on flutter",
        isCompleted: false,
        colorId: 0,
        id: "1"),
    TaskModel(
        title: "NodeJs",
        startTime: "11:00 AM",
        endTime: "12:00 AM",
        note: "Course on nodejs",
        isCompleted: true,
        colorId: 1,
        id: "2"),
    TaskModel(
        title: "Github",
        startTime: "1:00 AM",
        endTime: "2:00 AM",
        note: "Course on github",
        isCompleted: false,
        colorId: 2,
        id: "3"),
  ];
}
