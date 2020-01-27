//
//  ViewController.swift
//  RussiaNews
//
//  Created by Astemir Shibzuhov on 24.01.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    var newsModel: NewsModel = NewsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
       
        
        newsModel.delegate = self
        newsModel.getArticlesTopHeadlines()
        addTableView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Новости"
        
        let barButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "news"), style: .done, target: nil, action: nil)
        navigationItem.leftBarButtonItem = barButtonItem

        

        
    }
    
    func addTableView() {
        tableView.register(UINib(nibName: "NewsCell", bundle: nil).self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension ViewController: NewsModelDelegate, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if newsModel.articles == nil {
            return 0
        } else {
            return newsModel.articles!.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsCell
        if newsModel.articles != nil {
            newsModel.getArticle(at: indexPath.row)
            newsModel.downloadImage(link: newsModel.imageUrl!) { (image) in
                cell.newsImage.image = image
                self.newsModel.articlesDownloads[indexPath.row].image = image
            }
            cell.titleLable.text = newsModel.title
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let descriptionVC = DescriptionViewController()
        navigationController?.pushViewController(descriptionVC, animated: true)
        descriptionVC.titleLablel.text = newsModel.articlesDownloads[indexPath.row].title
        descriptionVC.descriptionLablel.text =  newsModel.articlesDownloads[indexPath.row].description
        descriptionVC.newsImage.image =  newsModel.articlesDownloads[indexPath.row].image
        descriptionVC.datePublished.text = newsModel.articlesDownloads[indexPath.row].datePublished
        descriptionVC.sourceUrlBtn.setTitle(newsModel.articlesDownloads[indexPath.row].sourceUrl, for: .normal)
        descriptionVC.navigationItem.title = newsModel.articlesDownloads[indexPath.row].author
        descriptionVC.url = newsModel.articlesDownloads[indexPath.row].sourceUrl

        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220.0
    }
    
    func updateNews() {
        tableView.reloadData()
    }
}

