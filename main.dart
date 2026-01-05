import 'package:flutter/material.dart';

void main() {
  runApp(const SystemApp());
}

class SystemApp extends StatelessWidget {
  const SystemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SYSTEM',
      theme: ThemeData.dark(),
      home: const SystemHome(),
    );
  }
}

class SystemHome extends StatefulWidget {
  const SystemHome({super.key});

  @override
  State<SystemHome> createState() => _SystemHomeState();
}

class _SystemHomeState extends State<SystemHome> {
  int level = 1;
  int exp = 0;
  int dailyCompleted = 0;

  void completeQuest() {
    setState(() {
      dailyCompleted++;
      exp += 20;
      if (exp >= 100) {
        level++;
        exp = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SYSTEM'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('LEVEL $level',
                style: const TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            LinearProgressIndicator(value: exp / 100),
            const SizedBox(height: 20),
            const Text('DAILY QUEST',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            QuestTile(
              title: '10 Push-ups',
              onComplete: completeQuest,
            ),
            QuestTile(
              title: 'Read 10 minutes',
              onComplete: completeQuest,
            ),
            QuestTile(
              title: 'No phone 1 hour',
              onComplete: completeQuest,
            ),
            const Spacer(),
            Text('Completed today: $dailyCompleted',
                style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class QuestTile extends StatelessWidget {
  final String title;
  final VoidCallback onComplete;

  const QuestTile({
    super.key,
    required this.title,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: ElevatedButton(
          onPressed: onComplete,
          child: const Text('COMPLETE'),
        ),
      ),
    );
  }
}