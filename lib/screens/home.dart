import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../aot.dart';
import '../widgets/aot_characters.dart' as a;
import '../dummy_data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //final TextEditingController _controller = TextEditingController();
  final AOT _aot = AOT();
  late Future _getCharacters;
  String? _search;
  @override
  void initState() {
    super.initState();
    _getCharacters = _aot.getAOTCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Provider.of<DummyData>(context, listen: false).logout();
                    },
                    icon: const Icon(Icons.logout),
                    color: Colors.black,
                  ),
                  const SizedBox(width: 5,),
                  Expanded(
                    child: TextField(
                      //controller: _controller,
                      decoration: InputDecoration(
                          label: const Text("Search for a character in AOT"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          prefixIcon: const Icon(Icons.search)),
                      onChanged: (value) {
                        setState(() {
                          _search = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: FutureBuilder(
                    future: _getCharacters,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return a.Characters(_aot.characters, _search);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
