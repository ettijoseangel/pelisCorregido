import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:pelis_app/search/search_delegate.dart';
import 'package:pelis_app/providers/movies_provider.dart';
import 'package:pelis_app/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  
  
  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Películas en cines'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon( Icons.search_outlined ),
            onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate() ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            // Tarjetas principales
            CardSwiper( movies: moviesProvider.onDisplayMovies ),

            // Slider de películas
            MovieSlider(
              movies: moviesProvider.popularMovies,// populares,
              title: 'Populares', // opcional
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),
            
          ],
        ),
      )
    );
  }
}