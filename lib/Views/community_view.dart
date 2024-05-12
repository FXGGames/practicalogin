import 'package:flutter/material.dart';
import 'package:practicalogin/Views/comments.dart';

class CommunityView extends StatefulWidget {
  const CommunityView({super.key});

  @override
  State<CommunityView> createState() => _CommunityViewState();
}

class _CommunityViewState extends State<CommunityView> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ContentWidget(
            gifUrl:
                'https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExejZvdGVzZ3U0OGhpZXRyNTFlNXJ2bnB0cnFtaDQyODUxNjlydjl1cyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/3oFzmsHnDK1lghblxS/giphy.gif',
            likes: 11,
            favorites: 5,
            opinions: 8,
          ),
          ContentWidget(
            gifUrl:
                'https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExNnE2c3liZm5kZHBsNGpnejF5NzY4eTMwdDF2Y3EwaW1nOHR3dTc1OSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/3ohc10MfrKXOvwNQ2s/giphy.gif',
            // URL del GIF
            likes: 15,
            favorites: 7,
            opinions: 12,
          ),
          ContentWidget(
              gifUrl:
                  "https://media3.giphy.com/media/26vIfaO6UpMy7Y8W4/200w.webp?cid=ecf05e473h2z9g71ljqrv4842e2w3omc6f0pnwbn8j22uiga&ep=v1_gifs_related&rid=200w.webp&ct=g",
              likes: 12,
              favorites: 3,
              opinions: 4)
          // Agrega más contenido aquí si lo deseas
        ],
      ),
    );
  }
}

class ContentWidget extends StatefulWidget {
  final String gifUrl;
  int likes;
  int favorites;
  int opinions;

  ContentWidget({
    Key? key,
    required this.gifUrl,
    required this.likes,
    required this.favorites,
    required this.opinions,
  }) : super(key: key);

  @override
  _ContentWidgetState createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8), // Margen de 8 en todos los lados
      child: Card(
        child: Column(
          children: [
            Image(
              image: NetworkImage(widget.gifUrl),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.thumb_up),
                  onPressed: () {
                    setState(() {
                      widget.likes++;
                    });
                  },
                ),
                Text('${widget.likes}'), // Muestra el número de "Me gusta"
                IconButton(
                  icon: Icon(Icons.bookmark_add),
                  onPressed: () {
                    setState(() {
                      widget.favorites++;
                    });
                  },
                ),
                Text('${widget.favorites}'), // Muestra el número de "Favoritas"
                IconButton(
                  icon: Icon(Icons.comment),
                  onPressed: () {
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> CommentCard()));
                      widget.opinions++;
                    });
                  },
                ),
                Text('${widget.opinions}'), // Muestra el número de "Opiniones"
              ],
            ),
          ],
        ),
      ),
    );
  }
}
