import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'logic/roadmap/roadmap_bloc.dart';
import 'data/repositories/roadmap_repository.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  runApp(const SkillNavigatorApp());
}

class SkillNavigatorApp extends StatelessWidget {
  const SkillNavigatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => RoadmapRepository(),
      child: BlocProvider(
        create: (context) => RoadmapBloc(context.read<RoadmapRepository>()),
        child: MaterialApp(
          title: 'SkillNavigator AI',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              brightness: Brightness.dark,
            ),
            textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}