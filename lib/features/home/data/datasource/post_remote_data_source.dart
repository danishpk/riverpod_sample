
import 'dart:convert';

import 'package:riverpod_sample/features/home/data/model/post_model.dart';

import '../../../../config/network_config.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getPosts();
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final RemoteNetworkConfig networkService;

  PostRemoteDataSourceImpl(this.networkService);

  @override
  Future<List<PostModel>> getPosts() async {
    var response = await networkService
        .dio
        .get("/post");
    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.data);
      return json.map((post) => PostModel.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
