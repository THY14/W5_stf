import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text("Favorite cards"),
          ),
          body: Column(
            children: const [
              FavoriteCard(title: 'Sunset', description: 'Beautiful sunset.'),
              FavoriteCard(title: 'Mountain', description: 'kirirom the best.'),
              FavoriteCard(title: 'school', description: 'Best place to relax.', initiallyFavorite: true),
            ],
          ),
        ),
      ),
    );

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({
    super.key,
    required this.title,
    required this.description,
    this.initiallyFavorite = false,
  });

  final String title;
  final String description;
  final bool initiallyFavorite;

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.initiallyFavorite;
  }

  // private getter 
  Icon get _iconLabel => _isFavorite
      ? const Icon(Icons.favorite, color: Colors.red)
      : const Icon(Icons.favorite_border, color: Colors.grey);

  void _onPressedFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: .5, color: Colors.grey)),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(widget.description),
              ],
            ),
          ),
          IconButton(
            onPressed: _onPressedFavorite,
            icon: _iconLabel,
            tooltip: _isFavorite ? 'Remove from favorites' : 'Add to favorites',
          ),
        ],
      ),
    );
  }
}
