import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

//StatelessWidget estado inmutable no puede cambiar
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'miApp',
      home: RandonWords(),
    );
  }
}

class RandonWordsState extends State<RandonWords> {
  
  final _lista = <WordPair>[];
  final fuenteGrande = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Título listas'),
      ),
      body: _buildSuggestion(),
    ); 
  }

  Widget _buildSuggestion(){
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i){
        if (i.isOdd) return Divider();
        final index = i ~/ 2;
        if (index >= _lista.length){
            _lista.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_lista[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair){
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: fuenteGrande,
      ),
    );
  }
}

//StatefulWidget mantiene el estado que puede cambiar durante el tiempo de vida del widget
class RandonWords extends StatefulWidget {
  @override
  RandonWordsState createState() => new RandonWordsState();
}
