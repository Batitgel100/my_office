// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class FilteredList extends StatefulWidget {
//   @override
//   _FilteredListState createState() => _FilteredListState();
// }

// class _FilteredListState extends State<FilteredList> {
//   List<String> items = []; // List to store all items
//   List<String> filteredItems = []; // List to store filtered items
//   late String selectedFilter; // Currently selected filter

//   @override
//   void initState() {
//     super.initState();
//     fetchData(); // Call the function to fetch data
//   }

//   Future<void> fetchData() async {
//     // Make the HTTP request to fetch data from the server
//     final response = await http.get(Uri.parse('your_api_url'));

//     if (response.statusCode == 200) {
//       // Parse the response data into a list of items
//       final data = jsonDecode(response.body);
//       items = List<String>.from(data);

//       // Set the initial filtered items list to all items
//       filteredItems = List<String>.from(items);

//       setState(() {});
//     } else {
//       throw Exception('Failed to fetch data');
//     }
//   }

//   void filterItems(String filter) {
//     // Filter the items based on the selected filter
//     if (filter == 'Filter 1') {
//       filteredItems = items.where((item) => /* Apply your filter condition */).toList();
//     } else if (filter == 'Filter 2') {
//       filteredItems = items.where((item) => /* Apply your filter condition */).toList();
//     } else {
//       // If no filter is selected, show all items
//       filteredItems = List<String>.from(items);
//     }

//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Filtered List'),
//       ),
//       body: Column(
//         children: [
//           DropdownButton<String>(
//             value: selectedFilter,
//             onChanged: (String? value) {
//               setState(() {
//                 selectedFilter = value!;
//                 filterItems(selectedFilter);
//               });
//             },
//             items: <String>[
//               'Filter 1',
//               'Filter 2',
//               'All',
//             ].map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value),
//               );
//             }).toList(),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: filteredItems.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(
//                   title: Text(filteredItems[index]),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: FilteredList(),
//   ));
// }
