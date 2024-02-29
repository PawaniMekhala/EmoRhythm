import 'package:flutter/material.dart';

import 'navbar.dart';

class ActivityLogPage extends StatefulWidget {
  

  
  const ActivityLogPage({super.key});

  @override
  State<ActivityLogPage> createState() => _ActivityLogPageState();
}

class _ActivityLogPageState extends State<ActivityLogPage> {
  get isDarkModeEnabled => false;
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: isDarkModeEnabled ? Colors.white : Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: const Color.fromRGBO(10, 39, 66, 1),
       
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            const Center(
              child: Text(
                'Activity Log',
                style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
                      ),
            ),
            const SizedBox(height: 50.0),
            _buildRecommendationHistoryContainer(),
            const SizedBox(height: 50.0),
            _buildEmotionResultsContainer(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
    
  }

  Widget _buildRecommendationHistoryContainer() {
    // Replace these with your actual data structures
    final List<String> recommendationHistory = ["Recommendation 1", "Recommendation 2", "Recommendation 3"];
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Recommendation History',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Add your recommendation history content here
          for (var recommendation in recommendationHistory)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                recommendation,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
            ),
        ],
      
      ),
      
    );
    
  }

  Widget _buildEmotionResultsContainer() {

     // Replace these with your actual data structures
    final List<String> emotionResults = ["Happy", "Sad", "Angry"];
    
    return Container(
     
      decoration: BoxDecoration(
        color: Colors.lightBlue, // You can change the color
        borderRadius: BorderRadius.circular(10.0),
        
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Emotion Results',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Add your emotion results content here
          for (var emotion in emotionResults)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                emotion,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
