//
//  ViewController.swift
//  RussiaNews
//
//  Created by Astemir Shibzuhov on 24.01.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var newsModel: NewsModel = NewsModel()
    
    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        return collectionView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsLargeContentViewer = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
       
        
        newsModel.delegate = self
        newsModel.getArticlesTopHeadlines()
        addCollectionView()
        addTableView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationItem.title = "Главное"
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: nil)
        barButtonItem.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        navigationItem.rightBarButtonItem = barButtonItem

        
        let barButtonItem_2 = UIBarButtonItem(title: "RussiaNews", style: .done, target: self, action: nil)
        barButtonItem_2.tintColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        navigationItem.leftBarButtonItem = barButtonItem_2

    }
    
    func addTableView() {
        tableView.register(UINib(nibName: "NewsCell", bundle: nil).self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant:  10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func addCollectionView() {
        collectionView.register(UINib(nibName: "NewsCategory", bundle: nil), forCellWithReuseIdentifier: "Cell")
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 55).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
}

extension ViewController: NewsModelDelegate, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - CollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! NewsCategory
        switch indexPath.row {
        case 0:
            cell.textLabel.text = "Главное"
        case 1:
            cell.textLabel.text = "Здоровье"
            cell.viewFromCell.backgroundColor = #colorLiteral(red: 0.01907301135, green: 0.6954192519, blue: 0.3252737522, alpha: 1)
        case 2:
            cell.textLabel.text = "Бизнес"
            cell.viewFromCell.backgroundColor = #colorLiteral(red: 0.3065021038, green: 0.3481286466, blue: 0.9621635079, alpha: 1)
        case 3:
            cell.textLabel.text = "Наука"
            cell.viewFromCell.backgroundColor = #colorLiteral(red: 0.76403898, green: 0.4585318565, blue: 0.2334323823, alpha: 1)
        case 4:
            cell.textLabel.text = "Спорт"
            cell.viewFromCell.backgroundColor = #colorLiteral(red: 0.619731009, green: 0.2137993276, blue: 0.5975114107, alpha: 1)
        case 5:
            cell.textLabel.text = "Техналогии"
            cell.viewFromCell.backgroundColor = #colorLiteral(red: 0.6607651114, green: 0.6064379811, blue: 0, alpha: 1)
        case 6:
            cell.textLabel.text = "Развлечения"
            cell.viewFromCell.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        default:
            break
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.row {
        case 0:
            return CGSize(width: 90, height: 45)
        case 1:
            return CGSize(width: 100, height: 45)
        case 2:
            return CGSize(width: 75, height: 45)
        case 3:
            return CGSize(width: 70, height: 45)
        case 4:
            return CGSize(width: 70, height: 45)
        case 5:
            return CGSize(width: 120, height: 45)
        default:
            break
        }
        return CGSize(width: 130, height: 45)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            newsModel.articlesDownloads.removeAll()
            newsModel.articles?.removeAll()
            newsModel.getArticlesCategory(by: "general")
            navigationItem.title = "Главное"
        case 1:
            newsModel.articlesDownloads.removeAll()
            newsModel.articles?.removeAll()
            newsModel.getArticlesCategory(by: "health")
            navigationItem.title = "Здоровье"
        case 2:
            newsModel.articlesDownloads.removeAll()
            newsModel.articles?.removeAll()
            newsModel.getArticlesCategory(by: "business")
            navigationItem.title = "Бизнес"
        case 3:
            newsModel.articlesDownloads.removeAll()
            newsModel.articles?.removeAll()
            newsModel.getArticlesCategory(by: "science")
            navigationItem.title = "Наука"
        case 4:
            newsModel.articlesDownloads.removeAll()
            newsModel.articles?.removeAll()
            newsModel.getArticlesCategory(by: "sports")
            navigationItem.title = "Спорт"
        case 5:
            newsModel.articlesDownloads.removeAll()
            newsModel.articles?.removeAll()
            newsModel.getArticlesCategory(by: "technology")
            navigationItem.title = "Технологии"
        case 6:
            newsModel.articlesDownloads.removeAll()
            newsModel.articles?.removeAll()
            newsModel.getArticlesCategory(by: "entertainment")
            navigationItem.title = "Развлечения"
        default:
            break
        }
    }

    // MARK: - TableViewDelegate
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let openArticleVC = OpenArticleLinkWeb()
        openArticleVC.url = newsModel.articlesDownloads[indexPath.row].sourceUrl
        present(openArticleVC, animated: true, completion: nil)
              
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220.0
    }
        
    // MARK: - NewsModelDelegate
    func updateNews() {
        tableView.reloadData()
    }
}

