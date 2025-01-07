import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/services.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  final TextEditingController _controller = TextEditingController();
  String? _result; // To store the API result in JSON format
  bool _isLoading = false; // To track API loading state

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _animationController.dispose();
    _controller.dispose();
    super.dispose();
  }

  Future<void> fetchData(String message) async {
    const String url = 'https://copilot5.p.rapidapi.com/copilot';
    const Map<String, String> headers = {
      'x-rapidapi-key': 'be533bbf32mshab0e1ce6ff2acb0p17ba9bjsn0a385474fda3',
      'x-rapidapi-host': 'copilot5.p.rapidapi.com',
      'Content-Type': 'application/json',
    };

    final Map<String, dynamic> body = {
      'message': message,
      'conversation_id': null,
      'tone': 'BALANCED',
      'markdown': false,
      'photo_url': null,
    };

    setState(() {
      _isLoading = true;
    });
    
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        // Extract and replace \n properly
        final message = jsonResponse['data']['message'];
        setState(() {
          _result = message.replaceAll(
              r'\n', '\n'); // Convert literal "\n" to line breaks
        });
      } else {
        setState(() {
          _result = 'Error: ${response.statusCode} - ${response.reasonPhrase}';
        });
      }
    } catch (error) {
      setState(() {
        _result = 'Exception occurred: $error';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Handle key events
  void _handleKeyEvent(RawKeyEvent event) {
    if (event is RawKeyDownEvent && event.logicalKey == LogicalKeyboardKey.enter) {
      // When the Enter key is pressed, trigger fetchData
      if (_controller.text.isNotEmpty) {
        fetchData(_controller.text);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Wrap the TextField inside RawKeyboardListener to handle Enter key press
            RawKeyboardListener(
              focusNode: FocusNode(),
              onKey: _handleKeyEvent, // Handle the Enter key press
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Ask for any medicine...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  fetchData(_controller.text);
                }
              },
              child: const Text('Search'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: _isLoading
                    ? Center(
                        child: SpinKitSquareCircle(
                          color: Colors.white,
                          size: 50.0,
                          controller: _animationController,
                        ),
                      )
                    : Text(
                        _result ?? 'Enter a query and press "Search".',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: 'Courier',
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
