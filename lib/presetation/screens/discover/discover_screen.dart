import 'package:flutter/material.dart';
import 'package:toktik_2_0/presetation/providers/discover_provider.dart';
import 'package:provider/provider.dart';
import 'package:toktik_2_0/presetation/widgets/shared/video_scrollable_view.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final discoverProvider = context.watch<DiscoverProvider>(); //llamar a la instancia de DiscoverProvider y mappear los cambios
    
    //final otroProvider = Provider.of<DiscoverProvider>(context);  //hace lo mismo que lo de arriba

    return Scaffold(
      body: discoverProvider.initialLoading
        ? const Center(child: CircularProgressIndicator( strokeWidth: 2 ))
        :  VideoScrollableView(videos: discoverProvider.videos)
    );
  }
}