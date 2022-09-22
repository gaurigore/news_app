import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/config/AppConstants.dart';
import 'package:news_app/model/ArticleModell.dart';
import 'package:news_app/model/NewsModal.dart';

class NewsApiService {
  String url;

  String _getApiKey(){
    return "?apiKey=" + AppConstants.API_KEY;
  }

  NewsApiService.everything(){
    this.url = AppConstants.BASE_URL + AppConstants.END_POINT_EVERYTHING + _getApiKey();
  }

  NewsApiService.topHeadlines(){
    this.url = AppConstants.BASE_URL + AppConstants.END_POINT_TOP_HEADLINE + _getApiKey();
  }

  NewsApiService.topHeadlinesSource(){
    this.url = AppConstants.BASE_URL + AppConstants.END_POINT_TOP_HEADLINE_SOURCES + _getApiKey();
  }

  NewsApiService withCategory(String category){
    this.url += "&category=$category";
    return this;
  }

  NewsApiService withCountry(String country){
    this.url += "&country=$country";
    return this;
  }

  Future<NewsModel> getNews() async {
    print(this.url);
    var response = await http.get(Uri.parse(this.url));
    return newsModelFromJson(response.body);
  }

}
