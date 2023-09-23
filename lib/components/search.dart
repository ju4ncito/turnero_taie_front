import 'package:flutter/material.dart';
import 'package:turnero_taie_front/api/api_manager.dart';
import 'package:turnero_taie_front/components/tutor_detail.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Search Page'),
        ),
        body: SearchScreen(),
      ),
    );
  }
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<User> searchResults = [];
  bool isLoading = false;

  Future<void> performSearch(query) async {
    setState(() {
      isLoading = true;
    });

    try {
      final apiManager = ApiManager();
      final response = await apiManager.apiModel.apiUsersGet();
      if (response.statusCode == 200) {
        setState(() {
          searchResults = response.body ?? [];
          if (query.isNotEmpty) {
            searchResults = searchResults.where((user) {
              for (final career in user.careers) {
                if (career.toLowerCase().contains(query.toLowerCase())) {
                  return true;
                }
              }
              return false;
            }).toList();
          } else {
            // If query is empty, clear the search results
            searchResults.clear();
          }
          isLoading = false; // Hide loader when data is available
        });
      } else {
        isLoading = false;
      }
    } catch (error) {
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            controller: searchController,
            onChanged: (query) {
              performSearch(query);
            },
            decoration: const InputDecoration(
              hintText: 'Enter your search query',
              suffixIcon: Icon(Icons.search),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: isLoading // Check the loading state
                ? const Center(
                    child: CircularProgressIndicator(), // Show loader
                  )
                : ListView.builder(
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(searchResults[index].fullName.toString()),
                        subtitle: Text(searchResults[index].email),
                        onTap: () {
                          // Navigate to the "tutor_detail" page when tapped
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  TutorDetailPage(user: searchResults[index]),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
