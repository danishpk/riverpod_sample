import '../entities/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();
  Future<void> savePosts(List<Post> posts);
}