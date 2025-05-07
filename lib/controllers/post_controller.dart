import 'package:get/get.dart';
import '../models/post_model.dart';
import '../services/api_services.dart';

class PostController extends GetxController {
  var posts = <Post>[].obs;
  var isLoading = false.obs;
  var error = ''.obs;

  @override
  void onInit() {
    fetchAllPosts();
    super.onInit();
  }

  void fetchAllPosts() async {  // function for fetch post
    try {
      isLoading(true);
      error('');
      posts.value = await ApiService.fetchPosts();  // called from api services
    } catch (e) {
      error(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> addPost(Post post) async {  // function for add post
    try {
      isLoading(true);
      error('');
      var newPost = await ApiService.createPost(post); // called from api services
      posts.insert(0, newPost); // Add on top
    } catch (e) {
      error(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> updatePost(Post post) async {   // function for update post
    try {
      isLoading(true);
      error('');
      var updated = await ApiService.updatePost(post);   // called from api services
      int index = posts.indexWhere((p) => p.id == post.id);
      if (index != -1) posts[index] = updated;
    } catch (e) {
      error(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void deletePost(int id) async {  // function for deletepost
    try {
      isLoading(true);
      error('');
      await ApiService.deletePost(id);   // called from api services
      posts.removeWhere((post) => post.id == id);
    } catch (e) {
      error(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
