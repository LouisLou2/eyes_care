enum RecordStatus {
  inProgress,
  completed,
  onHold,
  cancelled,
}

final class RecentRecord {
  final String id;
  final String name;
  final String result;
  final DateTime createdAt;
  final RecordStatus status;

  RecentRecord({
    required this.id,
    required this.name,
    required this.result,
    required this.createdAt,
    required this.status,
  });
}