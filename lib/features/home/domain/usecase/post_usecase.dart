
import '../entities/post.dart';
import '../repo/post_repository.dart';

class PostUseCase {
  final PostRepository repository;

  PostUseCase(this.repository);

  Future<List<Post>> getPost() async {
    return await repository.getPosts();
  }

  Future<void> savePost(List<Post> posts) async {
    await repository.savePosts(posts);
  }
}
