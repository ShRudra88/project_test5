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
      appBar: AppBar(title: const Text('Posts')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const FormScreen()),
        child: const Icon(Icons.add_box_sharp),
      ),

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.error.isNotEmpty) {
          return Center(child: Text('Error: ${controller.error}'));
        }

        return ListView.builder(
          itemCount: controller.posts.length,
          itemBuilder: (_, index) {
            final post = controller.posts[index];
            return ListTile(
              title: Text(post.title),
              subtitle: Text(post.body),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => Get.to(() => FormScreen(post: post)),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => controller.deletePost(post.id!),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
