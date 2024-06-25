sealed class TaskState {}

final class TaskInitial extends TaskState {}

final class GetDataTaskLoadingState extends TaskState {}

final class GetDataTaskSuccessState extends TaskState {}

final class GetDataTaskLErrorState extends TaskState {}

final class GetStartTimeTaskLoadingState extends TaskState {}

final class GetStartTimeTaskSuccessState extends TaskState {}

final class GetStartTimeTaskLErrorState extends TaskState {}

final class GetEndTimeTaskLoadingState extends TaskState {}

final class GetEndTimeTaskSuccessState extends TaskState {}

final class GetEndTimeTaskLErrorState extends TaskState {}

final class ChangeCheckMarkIndexState extends TaskState {}
