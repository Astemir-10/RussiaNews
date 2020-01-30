//
//  NewsModel.swift
//  RussiaNews
//
//  Created by Astemir Shibzuhov on 24.01.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


protocol NewsModelDelegate {
    func updateNews()
}

class NewsModel {
    var delegate: NewsModelDelegate!
    private var urlStrEverything = "https://newsapi.org/v2/everything?language=ru"
    private var urlStrTopHeadlines = "https://newsapi.org/v2/top-headlines?country=ru"
    private var apiKey = "11f0203310024cdb9fac8f010853d8db"
    
    var articles:[JSON]?
    var articlesDownloads:[NewsModel] = [NewsModel]()

    var numberOfViewrs = 0
    
    private let dateInstrument = DateInstrument()
    
    private var _title: String?
    private var _totalResult: Int?
    private var _author: String?
    private var _description: String?
    private var _sourceUrl: String?
    private var _imageUrl: String?
    private var _datePublished: String?
    private var _image: UIImage?

    
    var title: String? {
        get {
            guard let title = _title else {return nil}
            return title
        }
    }
    var totalResult: Int? {
        get {
            guard let totalResult = _totalResult else {return nil}
            return totalResult
        }
    }
    var author: String? {
        get {
            guard let author = _author else {return nil}
            return author
        }
    }
    var description: String? {
        get {
            guard let description = _description else {return nil}
            return description
        }
    }
    var sourceUrl: String? {
        get {
            guard let sourceUrl = _sourceUrl else {return nil}
            return sourceUrl
        }
    }
    
    var imageUrl: String? {
        get {
            guard let imageUrl = _imageUrl else {return nil}
            return imageUrl
        }
    }
    var datePublished: String? {
        get {
            guard let datePublished = _datePublished else {return nil}
            return datePublished
        }
    }
    var image: UIImage? {
        get {
            return _image
        }
        set {
            _image = newValue
        }
    }
    
    func getArticlesEverything(by keyword: String) {
        request(urlStrEverything, method: .get, parameters: ["q":keyword, "pageSize":"10","apiKey": apiKey], headers: nil).responseJSON { (response) in
            guard let data = response.data else {return}
            do {
                let json = try JSON(data: data)
                guard let articles = json["articles"].array else {return}
                self.articles = articles
                DispatchQueue.main.async {
                    self.delegate.updateNews()
                }
            } catch {
                
            }
        }
    }
    
    func getArticlesCategory(by category: String) {
        request(urlStrTopHeadlines, method: .get, parameters: ["pageSize":"10", "category":category ,"apiKey": apiKey], headers: nil).responseJSON { (response) in
            guard let data = response.data else {return}
            do {
                let json = try JSON(data: data)
                guard let articles = json["articles"].array else {return}
                self.articles = articles
                DispatchQueue.main.async {
                    self.delegate.updateNews()
                }
            } catch {
                
            }
        }
    }
    
    func getArticlesTopHeadlines() {
        request(urlStrTopHeadlines, method: .get, parameters: ["pageSize":"10", "apiKey": apiKey], headers: nil).responseJSON { (response) in
            guard let data = response.data else {return}
            do {
                let json = try JSON(data: data)
                guard let articles = json["articles"].array else {return}
                self.articles = articles
                DispatchQueue.main.async {
                    self.delegate.updateNews()
                }
            } catch {
                
            }
        }
    }
    
    
    func downloadImage(link: String, completion: @escaping (_ image: UIImage)->()) {
        request(link).response { (dataResponse) in
            guard let data = dataResponse.data else {return}
            guard let image = UIImage(data: data) else {return}
            completion(image)
        }
    }
    
    func getArticle(at index: Int) {
        
        
        guard let articles = articles else { print("articles not found")
            return}
        let article = articles[index]
        
        guard let title = article["title"].string else { print("error")
            return}
        self._title = title

        if let author = article["author"].string {
            self._author = author
        } else {
            self._author = "Неизвестно"
        }
            

        guard let description = article["description"].string else {return}
        self._description = description

        guard let sourceUrl = article["url"].string else {return}
        self._sourceUrl = sourceUrl

        guard let imageUrl = article["urlToImage"].string else {return}
        self._imageUrl = imageUrl

        guard let datePublished = article["publishedAt"].string else {return}
        let datePublishedNormal = dateInstrument.dateConverter(articleDate: datePublished)
        self._datePublished = datePublishedNormal
        
        let newsModel = NewsModel()
        newsModel._title = title
        newsModel._description = description
        newsModel._sourceUrl = sourceUrl
        newsModel._imageUrl = imageUrl
        newsModel._datePublished = datePublished
        self.articlesDownloads.append(newsModel)
    }
}
