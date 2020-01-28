//
//  SearchNewsViewController.swift
//  RussiaNews
//
//  Created by Astemir Shibzuhov on 25.01.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import UIKit

class SearchNewsViewController: UIViewController {
   
    
    
    let newsModel = NewsModel()
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
         navigationItem.title = "Поиск"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        searchBar.delegate = self
        addSearchBar()
        newsModel.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        addTableView()
        // Do any additional setup after loading the view.
    }
    
    private func addSearchBar() {
        view.addSubview(searchBar)
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
    
    private func addTableView() {
        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
 
    
    
    
}

extension SearchNewsViewController: UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource, NewsModelDelegate  {
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
            if let url =  newsModel.imageUrl {
                newsModel.downloadImage(link: url) { (image) in
                    cell.newsImage.image = image
                }
            } else {
                cell.newsImage.image = #imageLiteral(resourceName: "noImage")
            }
            cell.titleLable.text = newsModel.title
        }
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        newsModel.articlesDownloads.removeAll()
        newsModel.articles?.removeAll()
        guard let searchText = searchBar.text else {return}
        newsModel.getArticlesEverything(by: searchText)
        searchBar.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let openArticleVC = OpenArticleLinkWeb()
        openArticleVC.url = newsModel.articlesDownloads[indexPath.row].sourceUrl
        present(openArticleVC, animated: true, completion: nil)
              
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220.0
    }
    
    
    func updateNews() {
        tableView.reloadData()
    }

}
