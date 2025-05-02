import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik_2_0/config/theme/app_theme.dart';
import 'package:toktik_2_0/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:toktik_2_0/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:toktik_2_0/presetation/providers/discover_provider.dart';
import 'package:toktik_2_0/presetation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final videoPostRepository = VideoPostsRepositoryImpl( //instanciar el repositorio
      videosPostDataSource: LocalVideoDataSource() //instanciar el datasource
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DiscoverProvider>(
          lazy: false, //usar solo cuando se necesita que se cargue la data al inicio de la app para un proceso always-true :v

          create: (_) => DiscoverProvider(videosRepository: videoPostRepository)..loadNextPage(), 
          //operador cascada para llamar a loadNextPage() para llamar a la funcion
          //con una sola instancia
        ),
      ],
      child: MaterialApp(
        title: 'TokTik',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}