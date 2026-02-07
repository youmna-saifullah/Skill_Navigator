import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/roadmap/roadmap_bloc.dart';

class RoadmapDisplayScreen extends StatelessWidget {
  const RoadmapDisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your 30-Day Journey")),
      body: BlocBuilder<RoadmapBloc, RoadmapState>(
        builder: (context, state) {
          if (state is RoadmapLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RoadmapLoaded) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.tasks.length,
              itemBuilder: (context, index) {
                final item = state.tasks[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: CircleAvatar(child: Text("${item.day}")),
                    title: Text(item.topic, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(item.task),
                    trailing: IconButton(
                      icon: const Icon(Icons.open_in_new, color: Colors.blueAccent),
                      onPressed: () { /* Link to item.resource */ },
                    ),
                  ),
                );
              },
            );
          } else if (state is RoadmapError) {
            return Center(child: Text("Error: ${state.message}"));
          }
          return const Center(child: Text("Please start by generating a roadmap."));
        },
      ),
    );
  }
}