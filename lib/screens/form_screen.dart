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
  late TextEditingController _userIdController;
  // controllers for form

  @override
  void initState() {
    _titleController = TextEditingController(text: widget.post?.title ?? '');
    _bodyController = TextEditingController(text: widget.post?.body ?? '');
    _userIdController = TextEditingController(text: widget.post?.userId.toString() ?? '');

    //

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final PostController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post == null ? 'Create Post' : 'Update Post'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          return SingleChildScrollView(  // show form
            child: Form(
              key: _formKey,
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _userIdController,
                        decoration: InputDecoration(
                          labelText: 'User Id',
                          hintText: 'Enter your User id',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: const Icon(Icons.person),
                        ),
                        validator: (value) => value!.trim().isEmpty ? 'User Id is required' : null,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _titleController,
                        decoration: InputDecoration(
                          labelText: 'Title',
                          hintText: 'Enter post title',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: const Icon(Icons.title),
                        ),
                        validator: (value) => value!.trim().isEmpty ? 'Title is required' : null,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _bodyController,
                        decoration: InputDecoration(
                          labelText: 'Body',
                          hintText: 'Enter post content',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: const Icon(Icons.description),
                        ),
                        maxLines: 5,
                        validator: (value) => value!.trim().isEmpty ? 'Body is required' : null,
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          icon: Icon(widget.post == null ? Icons.add : Icons.update),
                          label: Text(widget.post == null ? 'Create Post' : 'Update Post'),
                          onPressed: controller.isLoading.value
                              ? null
                              : () async {
                            if (_formKey.currentState!.validate()) {
                              final post = Post(
                                id: widget.post?.id,
                                title: _titleController.text.trim(),
                                body: _bodyController.text.trim(),
                                userId: int.parse(_userIdController.text.trim()),

                              );
                              if (widget.post == null) {
                                await controller.addPost(post);
                              } else {
                                await controller.updatePost(post);
                              }
                              Get.back();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
