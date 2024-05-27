
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/features/home/data/datasource/post_local_data_source.dart';
import 'package:riverpod_sample/features/home/domain/usecase/post_usecase.dart';

import '../../../../config/network_config.dart';
import '../../data/datasource/post_remote_data_source.dart';
import '../../data/repo/post_repo_impl.dart';
import '../../domain/entities/post.dart';

final postRepositoryProvider = Provider<PostRepositoryImpl>((ref) {
  return PostRepositoryImpl(PostRemoteDataSourceImpl(RemoteNetworkConfig()), PostLocalDataSourceImpl());
});

// Define the use case providers
final postsProvider = Provider<PostUseCase>((ref) {
  return PostUseCase(ref.watch(postRepositoryProvider));
});

// Define the state provider for fetching posts
final getPostsProvider = FutureProvider<List<Post>>((ref) async {
  return await ref.watch(postsProvider).getPost();
});
