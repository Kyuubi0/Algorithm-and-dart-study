import 'package:flutter/material.dart';
import 'models/post.dart';
import 'services/api_service.dart';

class PostEditScreen extends StatefulWidget {
  final Post? post;

  const PostEditScreen({Key? key, this.post}) : super(key: key);

  @override
  _PostEditScreenState createState() => _PostEditScreenState();
}

class _PostEditScreenState extends State<PostEditScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    if (widget.post != null) {
      _titleController.text = widget.post!.title;
      _bodyController.text = widget.post!.body;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post == null ? 'Yeni Post' : 'Post Düzenle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Başlık'),
                validator: (value) => value!.isEmpty ? 'Başlık gerekli' : null,
              ),
              TextFormField(
                controller: _bodyController,
                decoration: InputDecoration(labelText: 'İçerik'),
                validator: (value) => value!.isEmpty ? 'İçerik gerekli' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Kaydet'),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final post = Post(
                      id: widget.post?.id,
                      title: _titleController.text,
                      body: _bodyController.text,
                    );
                    if (widget.post == null) {
                      await _apiService.addPost(post);
                    } else {
                      await _apiService.updatePost(post);
                    }
                    Navigator.pop(context, true);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
