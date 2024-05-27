import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/post_provider.dart';

class PostListWidget extends ConsumerWidget {
  const PostListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postList = ref.watch(getPostsProvider);

    return postList.when(
      data: (posts) => ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return ListTile(
            title: Text(post.title),
            subtitle: Text(post.body),
          );
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );

  }

}