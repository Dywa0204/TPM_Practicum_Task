import 'package:flutter/material.dart';
import 'package:praktpm_responsi/data/models/movie_detail_model.dart';

import '../data/api/data_source.dart';
import '../utils/global.dart';

class MovieDetailScreen extends StatefulWidget {
  final String id;
  const MovieDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState(id);
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late Future<MovieDetailModel> _futureMovieDetailModel;

  final String id;

  _MovieDetailScreenState(this.id);

  @override
  void initState() {
    _futureMovieDetailModel = ApiDataSource.instance.getDetailMovie(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: primaryColor,
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.arrow_back, color: Colors.white,)
                ),
                Text(
                  "MOVIE DETAIL",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Padding(
            padding: EdgeInsets.all(16),
            child: _buildListMovieBody(),
          ))
        ],
      ),
    );
  }

  Widget _buildListMovieBody() {
    return Container(
      child: FutureBuilder<MovieDetailModel>(
        future: _futureMovieDetailModel,
        builder: (BuildContext context, AsyncSnapshot<MovieDetailModel> snapshot) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            return _buildSuccessSection(snapshot.data!);
          }

          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Center(
      child: const Text("Error"),
    );
  }

  Widget _buildLoadingSection() {
    return Center(
      child: const CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(MovieDetailModel data) {
    return Column(
      children: [
        Image.network(data.Poster),
        SizedBox(height: 16,),
        Text(
          data.Title,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 30
          ),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 8,),
        Row(
          children: [
            Icon(Icons.watch_later_outlined, size: 16,),
            SizedBox(width: 6,),
            Text(data.Released)
          ],
        ),
        SizedBox(height: 6,),
        Row(
          children: [
            Icon(Icons.star_rate, size: 16,),
            SizedBox(width: 6,),
            Flexible(child: Text(data.imdbRating))
          ],
        ),SizedBox(height: 8,),
        Row(
          children: [
            Icon(Icons.category_outlined, size: 16,),
            SizedBox(width: 6,),
            Text(data.Genre)
          ],
        ),
        SizedBox(height: 6,),
        Row(
          children: [
            Icon(Icons.edit, size: 16,),
            SizedBox(width: 6,),
            Flexible(child: Text(data.Writer))
          ],
        ),
        SizedBox(height: 6,),
        Row(
          children: [
            Icon(Icons.person, size: 16,),
            SizedBox(width: 6,),
            Flexible(child: Text(data.Actors))
          ],
        ),
        SizedBox(height: 12,),
        Row(
          children: [
            Flexible(
              child: Text(data.Plot, textAlign: TextAlign.justify,),
            )
          ],
        ),
      ],
    );
  }
}
