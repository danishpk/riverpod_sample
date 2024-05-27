import 'package:flutter/material.dart';
import 'package:riverpod_sample/features/home/presentation/widget/post_list_widget.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: const PostListWidget(),
    );
  }
}


