import 'package:typesafehttp/models/post.dart';
import 'package:typesafehttp/models/post_serializable.dart';
import 'package:typesafehttp/networking/http_service.dart';


class PostRepository {
  var _postSerializable;
  
  HttpService<Post, PostSerializable> _postHttpService;

  PostRepository() {
    _postSerializable = PostSerializable();
    _postHttpService = HttpService(_postSerializable);
  }

  Future<Post> get(String id) async {
    return _postHttpService.get("/posts/$id");
  }

  Future<List<Post>> getAll() async {
    return _postHttpService.getAll("/posts");
  }

  Future<Post> send(Post post) async {
    return _postHttpService.post("/posts", post);
  }
}
