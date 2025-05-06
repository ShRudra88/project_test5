import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/post_controller.dart';
import '../models/post_model.dart';

class FormScreen extends StatefulWidget {
  final Post? post;

  const FormScreen({super.key, this.post});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _bodyController;

  @override
  void initState() {
    _titleController = TextEditingController(text: widget.post?.title ?? '');
    _bodyController = TextEditingController(text: widget.post?.body ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final PostController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post == null ? 'Create Post' : 'Update Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          return Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                  validator: (value) => value!.isEmpty ? 'Title required' : null,
                ),
                TextFormField(
                  controller: _bodyController,
                  decoration: const InputDecoration(labelText: 'Body'),
                  validator: (value) => value!.isEmpty ? 'Body required' : null,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () {
                    if (_formKey.currentState!.validate()) {
                      final post = Post(
                        id: widget.post?.id,
                        title: _titleController.text,
                        body: _bodyController.text,
                        userId: 1,
                      );
                      if (widget.post == null) {
                        controller.addPost(post);
                      } else {
                        controller.updatePost(post);
                      }
                      Get.back(); // Go back to home screen
                    }
                  },
                  child: Text(widget.post == null ? 'Create' : 'Update'),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
