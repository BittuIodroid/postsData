class PostModel {
  List<Posts> posts;

  PostModel({this.posts});

  PostModel.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = new List<Posts>();
      json['posts'].forEach((v) {
        posts.add(new Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.posts != null) {
      data['posts'] = this.posts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  String image;
  String name;
  String date;
  String post;
  int like;
  int dislike;
  List<Comment> comment;

  Posts(
      {this.image,
        this.name,
        this.date,
        this.post,
        this.like,
        this.dislike,
        this.comment});

  Posts.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    date = json['date'];
    post = json['post'];
    like = json['like'];
    dislike = json['dislike'];
    if (json['comment'] != null) {
      comment = new List<Comment>();
      json['comment'].forEach((v) {
        comment.add(new Comment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['date'] = this.date;
    data['post'] = this.post;
    data['like'] = this.like;
    data['dislike'] = this.dislike;
    if (this.comment != null) {
      data['comment'] = this.comment.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comment {
  String image;
  String name;
  String date;
  int like;
  int dislike;
  List<Reply> reply;

  Comment(
      {this.image, this.name, this.date, this.like, this.dislike, this.reply});

  Comment.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    date = json['date'];
    like = json['like'];
    dislike = json['dislike'];
    if (json['reply'] != null) {
      reply = new List<Reply>();
      json['reply'].forEach((v) {
        reply.add(new Reply.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['date'] = this.date;
    data['like'] = this.like;
    data['dislike'] = this.dislike;
    if (this.reply != null) {
      data['reply'] = this.reply.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reply {
  String image;
  String name;
  String date;
  int like;
  int dislike;

  Reply({this.image, this.name, this.date, this.like, this.dislike});

  Reply.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    date = json['date'];
    like = json['like'];
    dislike = json['dislike'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['date'] = this.date;
    data['like'] = this.like;
    data['dislike'] = this.dislike;
    return data;
  }
}