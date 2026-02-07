import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/roadmap_model.dart';
import '../../data/repositories/roadmap_repository.dart';

// Events
abstract class RoadmapEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadRoadmap extends RoadmapEvent {
  final String field;
  final String experience;
  LoadRoadmap(this.field, this.experience);
}

// States
abstract class RoadmapState extends Equatable {
  @override
  List<Object> get props => [];
}

class RoadmapInitial extends RoadmapState {}
class RoadmapLoading extends RoadmapState {}
class RoadmapLoaded extends RoadmapState {
  final List<RoadmapTask> tasks;
  RoadmapLoaded(this.tasks);
}
class RoadmapError extends RoadmapState {
  final String message;
  RoadmapError(this.message);
}

// BLoC
class RoadmapBloc extends Bloc<RoadmapEvent, RoadmapState> {
  final RoadmapRepository repository;

  RoadmapBloc(this.repository) : super(RoadmapInitial()) {
    on<LoadRoadmap>((event, emit) async {
      emit(RoadmapLoading());
      try {
        final tasks = await repository.fetchRoadmap(event.field, event.experience);
        emit(RoadmapLoaded(tasks));
      } catch (e) {
        emit(RoadmapError(e.toString()));
      }
    });
  }
}