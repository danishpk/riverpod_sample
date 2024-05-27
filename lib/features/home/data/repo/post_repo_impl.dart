
import '../../domain/entities/post.dart';
import '../../domain/repo/post_repository.dart';
import '../datasource/post_local_data_source.dart';
import '../datasource/post_remote_data_source.dart';
import '../model/post_model.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;

  PostRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<List<Post>> getPosts() async {
    try {
      final remotePosts = await remoteDataSource.getPosts();
      await localDataSource.savePosts(remotePosts);
      return remotePosts;
    } catch (e) {
      final localPosts = await localDataSource.getPosts();
      return localPosts;
    }
  }

  @override
  Future<void> savePosts(List<Post> posts) async {
    final postModels = posts.map((post) => PostModel(id: post.id, title: post.title, body: post.body)).toList();
    await localDataSource.savePosts(postModels);
  }
}
