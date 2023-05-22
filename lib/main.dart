import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkpoint 3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Team> footballTeams = [
    Team(
      name: 'Corinthians',
      logoUrl: 'assets/corinthians.png',
      subtitleText: 'O maior time do mundo',
      foundingDate: '1 de setembro de 1910',
      city: 'São Paulo',
      titles: ['Campeonato Brasileiro', 'Copa Libertadores'],
      rating: 0,
    ),
    Team(
      name: 'Flamengo',
      logoUrl: 'assets/flamengo.png',
      subtitleText: 'Time ajudado pela CBF',
      foundingDate: '17 de novembro de 1895',
      city: 'Rio de Janeiro',
      titles: ['Campeonato Brasileiro', 'Copa Libertadores'],
      rating: 0,
    ),
    Team(
      name: 'Palmeiras',
      logoUrl: 'assets/palmeiras.png',
      subtitleText: 'Bi-rebaixados',
      foundingDate: '26 de agosto de 1914',
      city: 'São Paulo',
      titles: ['Campeonato Brasileiro', 'Copa Libertadores'],
      rating: 0,
    ),
    Team(
      name: 'Santos',
      logoUrl: 'assets/santos.jpg',
      subtitleText: 'Tiveram Pelé e Neymar',
      foundingDate: '14 de abril de 1912',
      city: 'Santos',
      titles: ['Campeonato Brasileiro', 'Copa Libertadores'],
      rating: 0,
    ),
    Team(
      name: 'São Paulo',
      logoUrl: 'assets/saopaulo.png',
      subtitleText: 'Time do passado',
      foundingDate: '25 de janeiro de 1930',
      city: 'São Paulo',
      titles: ['Campeonato Brasileiro', 'Copa Libertadores'],
      rating: 0,
    ),
    Team(
      name: 'Vasco',
      logoUrl: 'assets/vasco.png',
      subtitleText: 'Gigante da colina',
      foundingDate: '21 de agosto de 1898',
      city: 'Rio de Janeiro',
      titles: ['Campeonato Brasileiro', 'Copa Libertadores'],
      rating: 0,
    ),
    Team(
      name: 'Internacional',
      logoUrl: 'assets/internacional.png',
      subtitleText: 'Põe no DVD',
      foundingDate: '4 de abril de 1909',
      city: 'Porto Alegre',
      titles: ['Campeonato Brasileiro', 'Copa Libertadores'],
      rating: 0,
    ),
    Team(
      name: 'Atlético Mineiro',
      logoUrl: 'assets/atletico_mineiro.png',
      subtitleText: 'Maior de minas',
      foundingDate: '25 de março de 1908',
      city: 'Belo Horizonte',
      titles: ['Campeonato Brasileiro', 'Copa Libertadores'],
      rating: 0,
    ),
    Team(
      name: 'Cruzeiro',
      logoUrl: 'assets/cruzeiro.png',
      subtitleText: 'Dono: Ronaldo Fenômeno',
      foundingDate: '2 de janeiro de 1921',
      city: 'Belo Horizonte',
      titles: ['Campeonato Brasileiro', 'Copa Libertadores'],
      rating: 0,
    ),
  ];

  void updateRating(int teamIndex, int rating) {
    setState(() {
      footballTeams[teamIndex].rating = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Times brasileiros'),
      ),
      body: ListView.builder(
        itemCount: footballTeams.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TeamDetailsPage(
                    team: footballTeams[index],
                    onRatingSelected: (rating) {
                      updateRating(index, rating);
                    },
                  ),
                ),
              );
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(footballTeams[index].logoUrl),
              ),
              title: Text(footballTeams[index].name),
              subtitle: Text(footballTeams[index].subtitleText),
              trailing: Text('Avaliação: ${footballTeams[index].rating}'),
            ),
          );
        },
      ),
    );
  }
}

class Team {
  final String name;
  final String logoUrl;
  final String subtitleText;
  final String foundingDate;
  final String city;
  final List<String> titles;
  int rating;

  Team({
    required this.name,
    required this.logoUrl,
    required this.subtitleText,
    required this.foundingDate,
    required this.city,
    required this.titles,
    required this.rating,
  });
}

class TeamDetailsPage extends StatefulWidget {
  final Team team;
  final ValueChanged<int> onRatingSelected;

  TeamDetailsPage({
    required this.team,
    required this.onRatingSelected,
  });

  @override
  _TeamDetailsPageState createState() => _TeamDetailsPageState();
}

class _TeamDetailsPageState extends State<TeamDetailsPage> {
  int _selectedRating = 0;

  void _selectRating(int rating) {
    setState(() {
      _selectedRating = rating;
    });
    widget.onRatingSelected(rating);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: Text(widget.team.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              widget.team.logoUrl,
              width: 200,
              height: 200,
            ),
            SizedBox(height: 16.0),
            Text(
              'Data de Surgimento: ${widget.team.foundingDate}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Cidade de Criação: ${widget.team.city}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Títulos:',
              style: TextStyle(fontSize: 18.0),
            ),
            Column(
              children: widget.team.titles
                  .map((title) => Text(
                        '- $title',
                        style: TextStyle(fontSize: 16.0),
                      ))
                  .toList(),
            ),
            SizedBox(height: 16.0),
            Text(
              'Classificação:',
              style: TextStyle(fontSize: 18.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.star_border),
                  color: _selectedRating >= 1 ? Colors.amber : Colors.grey,
                  onPressed: () => _selectRating(1),
                ),
                IconButton(
                  icon: Icon(Icons.star_border),
                  color: _selectedRating >= 2 ? Colors.amber : Colors.grey,
                  onPressed: () => _selectRating(2),
                ),
                IconButton(
                  icon: Icon(Icons.star_border),
                  color: _selectedRating >= 3 ? Colors.amber : Colors.grey,
                  onPressed: () => _selectRating(3),
                ),
                IconButton(
                  icon: Icon(Icons.star_border),
                  color: _selectedRating >= 4 ? Colors.amber : Colors.grey,
                  onPressed: () => _selectRating(4),
                ),
                IconButton(
                  icon: Icon(Icons.rate_review),
                  color: _selectedRating >= 5 ? Colors.amber : Colors.grey,
                  onPressed: () => _selectRating(5),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
