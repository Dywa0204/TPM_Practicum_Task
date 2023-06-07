import 'package:flutter/material.dart';
import 'package:praktpm_responsi/data/api/data_source.dart';
import 'package:praktpm_responsi/data/models/movie_model.dart';
import 'package:praktpm_responsi/screens/movie_detail_screen.dart';

import '../utils/global.dart';

class MovieListScreen extends StatefulWidget {
  final String keyword;
  const MovieListScreen({Key? key, required this.keyword}) : super(key: key);

  @override
  State<MovieListScreen> createState() => _MovieListScreenState(keyword);
}

class _MovieListScreenState extends State<MovieListScreen> {
  late Future<List<MovieModel>> _futureMoviesModel;

  final String keyword;

  _MovieListScreenState(this.keyword);

  @override
  void initState() {
    _futureMoviesModel = ApiDataSource.instance.searchMovie(keyword);
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
                  "SEARCH MOVIES",
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
      child: FutureBuilder<List<MovieModel>>(
        future: _futureMoviesModel,
        builder: (BuildContext context, AsyncSnapshot<List<MovieModel>> snapshot) {
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

  Widget _buildSuccessSection(List<MovieModel> data) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return _buildItemProduct(context, data[index]);
        },
        separatorBuilder: (BuildContext context, int index) => SizedBox(height: 8,),
        itemCount: data.length
    );
  }

  Widget _buildItemProduct(BuildContext context, MovieModel movie) {
    return GestureDetector(
      onTap: () async {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return MovieDetailScreen(id: movie.imdbID);
        }));
      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
        ),
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            title: Text(movie.Title!),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(movie.Poster!),
            ),
            subtitle: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.category_outlined, size: 16,),
                    SizedBox(width: 6,),
                    Text(movie.Type!)
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.watch_later_outlined, size: 16,),
                    SizedBox(width: 6,),
                    Flexible(child: Text(movie.Year!))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
