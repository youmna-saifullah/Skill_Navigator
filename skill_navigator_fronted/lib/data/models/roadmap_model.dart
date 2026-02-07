class RoadmapTask {
  final int day;
  final String topic;
  final String task;
  final String resource;
  bool isCompleted; // Added for Feature 3: Progress Tracker

  RoadmapTask({
    required this.day,
    required this.topic,
    required this.task,
    required this.resource,
    this.isCompleted = false,
  });

  factory RoadmapTask.fromJson(Map<String, dynamic> json) {
    return RoadmapTask(
      day: json['day'],
      topic: json['topic'],
      task: json['task'],
      resource: json['resource'] ?? "",
    );
  }
}