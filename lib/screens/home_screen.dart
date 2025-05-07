import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/post_controller.dart';
import 'form_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PostController controller = Get.put(PostController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.to(() => const FormScreen()),
        icon: const Icon(Icons.add_box_sharp),
        label: const Text("Add Post"),  // button for going form screen
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());  // show progress bar if loading
        }
        if (controller.error.isNotEmpty) {
          return Center(
            child: Text(
              'Error: ${controller.error}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        if (controller.posts.isEmpty) {
          return const Center(child: Text("No posts found."));  // show text if no posts found
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: controller.posts.length,
          itemBuilder: (_, index) {
            final post = controller.posts[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(    // show posts
                contentPadding: const EdgeInsets.all(16),
                title: Text(
                  post.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    post.body,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ),
                trailing: Wrap(
                  spacing: 12,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () => Get.to(() => FormScreen(post: post)),  // button for going form screen
                      tooltip: 'Edit',
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => controller.deletePost(post.id!),  // button for delete post
                      tooltip: 'Delete',
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
