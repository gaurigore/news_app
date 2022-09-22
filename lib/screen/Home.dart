import 'package:flutter/material.dart';
import 'package:news_app/data/NewsApiService.dart';
import 'package:news_app/data/NewsCategory.dart';
import 'package:news_app/model/CategoryModel.dart';
import 'package:news_app/model/NewsModal.dart';
import 'package:news_app/screen/NewsWebView.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = true;
  bool _error = false;
  List<CategoryModel> categorise = [];

  NewsModel newsModel;

  void initState() {
    super.initState();
    categorise = getCategories();
    getNews(country: "in");
  }

  void getNews({String category, String country, String language}) async {
    NewsApiService newsApiService = NewsApiService.topHeadlines();

    if (category != null) {
      newsApiService = newsApiService.withCategory(category);
    }
    if (country != null) {
      newsApiService = newsApiService.withCountry(country);
    }

    newsModel = await newsApiService.getNews();

    print(newsModel.toJson());

    if (newsModel.status != "ok") {
      setState(() {
        _error = true;
      });
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              height: 100,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: categorise.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _loading = true;
                        });
                        getNews(
                          category: categorise[index].categoryName,
                          country: "in",
                        );
                      },
                      child: CategoryTile(
                        imageUrl: categorise[index].imageUrl,
                        categoryName: categorise[index].categoryName,
                      ),
                    );
                  }),
            ),
            !_error
                ? (_loading
                ? Center(
              child: CircularProgressIndicator(),
            )
                : SingleChildScrollView(
              child: Column(
                children: [...getBlogTiles()],
              ),
            ))
                : Center(
              child: Text("Some Error Occurred"),
            )
          ],
        ),
      ),
    );
  }

  List<BlogTile> getBlogTiles() {
    List<BlogTile> list = [];

    newsModel.articles.forEach((article) {
      if (article.urlToImage != null && article.urlToImage.startsWith("http") &&
          article.description != null) {
        list.add(BlogTile(
          imageUrl: article.urlToImage,
          title: article.title,
          description: article.description,
          url: article.url,
            publishedAt: article.publishedAt,


        ));
      }
    });

    return list;
  }
}

class CategoryTile extends StatelessWidget {
  final String imageUrl, categoryName;

  CategoryTile({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                imageUrl,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.4,
                height: MediaQuery
                    .of(context)
                    .size
                    .width * 0.2,
                fit: BoxFit.cover,
              )),
          Container(
              alignment: Alignment.center,
              height: MediaQuery
                  .of(context)
                  .size
                  .width * 0.2,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.4,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                categoryName,
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final imageUrl, title, description, url,publishedAt;

  BlogTile({this.imageUrl, this.title, this.description, this.url,this.publishedAt});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    NewsWebView(
                      blogUrl: url,
                    )));
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          padding: EdgeInsets.only(top: 16),
          child: Column(
            children: [
          ClipRRect(
          child: FadeInImage.assetNetwork(placeholder: "assets/images/placeholder.jpg",
            image: imageUrl,fit: BoxFit.cover,),
          borderRadius: BorderRadius.circular(12),
      ),
      Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
              child: Text(title,
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold))),

          SizedBox(height: MediaQuery.of(context).size.height*0.01,),
          Container(child: Text(description)),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),
          Text(publishedAt.toString()),

        ],
      ),
      ),
      ],
    ))
    ,
    );
  }
}
