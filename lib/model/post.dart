class Post {
  const Post({
    this.title,
    this.author,
    this.imageUrl,
  });

  final String title;
  final String author;
  final String imageUrl;
}

final List<Post> posts = [
  Post(
      title: '让 monad 飞一会儿',
      author: 'paprikaLang',
      imageUrl:
          'https://paprika-dev.b0.upaiyun.com/2j7rwz5R0S2b8rqyt2PEK2dn87MG49choZN1Qt3M.jpeg'),
  Post(
      title: '抽象语法术',
      author: 'tiyo',
      imageUrl:
          'https://paprika-dev.b0.upaiyun.com/PwwiXKhtEwNrTvQkwQdHNFvc7YNGMv1lfD6OyDbg.jpeg'),
  Post(
      title: '枫叶并发秋瑟瑟',
      author: 'paprikaLang',
      imageUrl:
          'https://paprika-dev.b0.upaiyun.com/9d8bHLZbMdTpVwTQju6y3N55SpqQbwixv5UVfmFZ.jpeg'),
  Post(
      title: 'GraphQL 之 心动的信号',
      author: 'tiyo',
      imageUrl:
          'https://paprika-dev.b0.upaiyun.com/QRHh0i1Wob23MwJXgyVlvnf3lXNYuvYg4kV16xLr.jpeg'),
  Post(
      title: '接口与解耦',
      author: 'tiyo',
      imageUrl:
          'https://paprika-dev.b0.upaiyun.com/Lpyx2fePqWnwRYPtDxvwA89K70tD54ywzMydiN2e.jpeg'),
  Post(
      title: '红色皇后的死锁效应',
      author: 'tiyo',
      imageUrl:
          'https://paprika-dev.b0.upaiyun.com/VZnvm7Gum43w2SEEdgQRyNADz4nGwHwVyXcJAJdI.jpeg')
];
