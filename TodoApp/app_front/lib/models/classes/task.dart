class Task{
  List<Task> tasks;
  String taskId;
  String title;
  String note;
  DateTime timeToComplete;
  bool complete;
  String repeats;
  DateTime deadline;
  List<DateTime> reminder;

  Task(this.title, this.complete, this.taskId);
}