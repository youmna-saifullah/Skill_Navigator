import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/roadmap/roadmap_bloc.dart';
import 'roadmap_display_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _fieldController = TextEditingController();
  String _experience = 'Beginner';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.auto_awesome, size: 80, color: Colors.deepPurpleAccent),
              const SizedBox(height: 20),
              Text("SkillNavigator AI", style: Theme.of(context).textTheme.headlineMedium),
              const Text("Generate your 30-day career path in seconds"),
              const SizedBox(height: 40),
              TextField(
                controller: _fieldController,
                decoration: const InputDecoration(
                  labelText: "Enter Skill (e.g. Flutter, Python)",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _experience,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                items: ['Beginner', 'Intermediate', 'Advanced'].map((val) => 
                  DropdownMenuItem(value: val, child: Text(val))).toList(),
                onChanged: (val) => setState(() => _experience = val!),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurpleAccent),
                  onPressed: () {
                    context.read<RoadmapBloc>().add(LoadRoadmap(_fieldController.text, _experience));
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const RoadmapDisplayScreen()));
                  },
                  child: const Text("Generate Roadmap", style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}