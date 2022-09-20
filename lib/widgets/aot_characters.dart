import 'package:flutter/material.dart';

class Characters extends StatefulWidget {
  final List<Map<String, dynamic>> _list;
  final String? _search;
  Characters(this._list, this._search);
  @override
  State<Characters> createState() => _CharactersState();
}



class _CharactersState extends State<Characters> {
  int _isExpanded = -1;
  List<Map<String, dynamic>>  _filterList = [];
  Future _filterSBasedOnSearch() {
  if (widget._search != null) {
    _filterList = widget._list.where(
      (element) => element['first_name'].toString().toLowerCase().startsWith(
            widget._search!.toLowerCase(),
          ),
    ).toList();
    return Future.delayed(Duration.zero);
  }
  _filterList = widget._list;
  return Future.delayed(Duration.zero);
}
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _filterSBasedOnSearch(),
        builder: (_, snap) {
          return ListView.builder(
            itemCount: _filterList.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  ListTile(
                    tileColor:
                        _isExpanded == index ? Colors.black : Colors.white,
                    onTap: () {
                      setState(() {
                        _isExpanded = _isExpanded == index ? -1 : index;
                      });
                    },
                    leading: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://i.pinimg.com/originals/57/ed/3b/57ed3b5c113d60d1fa0eced7e2e37357.png"),
                    ),
                    title: Text(
                      _filterList[index]["first_name"],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:
                            _isExpanded == index ? Colors.white : Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      "${_filterList[index]["first_name"]} ${_filterList[index]["last_name"]}",
                      style: TextStyle(
                        color:
                            _isExpanded == index ? Colors.white : Colors.black,
                      ),
                    ),
                    trailing: _isExpanded != index
                        ? const Icon(Icons.arrow_circle_down)
                        : const Icon(
                            Icons.arrow_circle_up,
                            color: Colors.white,
                          ),
                  ),
                  if (_isExpanded == index)
                    Container(
                      color: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Properties("Species", _filterList[index]["species"]),
                          Properties(
                              "Age", _filterList[index]["age"].toString()),
                          Properties("Height",
                              _filterList[index]["height"].toString()),
                          Properties(
                              "Residence", _filterList[index]["residence"]),
                          Properties("Status", _filterList[index]["status"]),
                          Properties("Alias", _filterList[index]["alias"]),
                        ],
                      ),
                    ),
                ],
              );
            },
          );
        });
  }
}

class Properties extends StatelessWidget {
  final String _pName;
  final String? _text;
  Properties(this._pName, this._text);

  @override
  Widget build(BuildContext context) {
    return Text(
      "$_pName : ${_text == null ? "Empty" : _text}",
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
