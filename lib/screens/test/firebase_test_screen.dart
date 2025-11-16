import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseTestScreen extends StatelessWidget {
  const FirebaseTestScreen({super.key});

  Future<void> testFirebaseConnection() async {
    try {
      // Test Firestore connection
      await FirebaseFirestore.instance.collection('test').doc('test_doc').set({
        'message': 'Hello Firebase!',
        'timestamp': FieldValue.serverTimestamp(),
      });

      print('✅ Firebase connection successful!');
    } catch (e) {
      print('❌ Firebase connection failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firebase Test')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Firebase Connection Test',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: testFirebaseConnection,
              child: const Text('Test Firebase Connection'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Check console/terminal for results',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
