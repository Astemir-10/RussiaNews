//
//  DescriptionViewController.swift
//  RussiaNews
//
//  Created by Astemir Shibzuhov on 25.01.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import UIKit
import WebKit

class DescriptionViewController: UIViewController {
    
    var url: String?

    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        scroll.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    lazy var contentViewForScrollView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    
    lazy var newsImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "news"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "search")
        return imageView
    }()
    
    lazy var sourceLablel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var titleLablel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionLablel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var authorLablel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var sourceUrlBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1), for: .normal)
        button.titleLabel?.textAlignment = .left
        
        
        
        return button
    }()
    
    lazy var datePublished: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Новости"
        
        constraintsForLables()
        constraintsContentViewForScrollView()
        addConstraintsScrollView()
        
    }
    
    func constraintsForLables() {
        
        contentViewForScrollView.addSubview(datePublished)
        datePublished.topAnchor.constraint(equalTo: contentViewForScrollView.topAnchor, constant: 8).isActive = true
        datePublished.leadingAnchor.constraint(equalTo: contentViewForScrollView.leadingAnchor, constant: 16).isActive = true
        datePublished.trailingAnchor.constraint(equalTo: contentViewForScrollView.trailingAnchor, constant: -16).isActive = true
        
        
        
        contentViewForScrollView.addSubview(titleLablel)
        titleLablel.topAnchor.constraint(equalTo: datePublished.bottomAnchor, constant: 8).isActive = true
        titleLablel.leadingAnchor.constraint(equalTo: contentViewForScrollView.leadingAnchor, constant: 16).isActive = true
        titleLablel.trailingAnchor.constraint(equalTo: contentViewForScrollView.trailingAnchor, constant: -16).isActive = true
        
        
        contentViewForScrollView.addSubview(newsImage)
        newsImage.topAnchor.constraint(equalTo: titleLablel.bottomAnchor, constant: 8).isActive = true
        newsImage.leadingAnchor.constraint(equalTo: contentViewForScrollView.leadingAnchor, constant: 16).isActive = true
        newsImage.heightAnchor.constraint(equalToConstant: 312).isActive = true
        newsImage.trailingAnchor.constraint(equalTo: contentViewForScrollView.trailingAnchor, constant: -16).isActive = true
        
        contentViewForScrollView.addSubview(descriptionLablel)
        descriptionLablel.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: 8).isActive = true
        descriptionLablel.leadingAnchor.constraint(equalTo: contentViewForScrollView.leadingAnchor, constant: 16).isActive = true
        descriptionLablel.trailingAnchor.constraint(equalTo: contentViewForScrollView.trailingAnchor, constant: -16).isActive = true
        
        
        sourceUrlBtn.addTarget(self, action: #selector(openSourceLink), for: .touchUpInside)
        contentViewForScrollView.addSubview(sourceUrlBtn)
        sourceUrlBtn.topAnchor.constraint(equalTo: descriptionLablel.bottomAnchor, constant: 8).isActive = true
        sourceUrlBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true

        sourceUrlBtn.leadingAnchor.constraint(equalTo: contentViewForScrollView.leadingAnchor, constant: 16).isActive = true
        sourceUrlBtn.trailingAnchor.constraint(equalTo: contentViewForScrollView.trailingAnchor, constant: -16).isActive = true
        sourceUrlBtn.bottomAnchor.constraint(equalTo: contentViewForScrollView.bottomAnchor, constant: -16).isActive = true
    }
    
    func constraintsContentViewForScrollView() {
        scrollView.addSubview(contentViewForScrollView)
        contentViewForScrollView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor).isActive = true
        contentViewForScrollView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor).isActive = true
        contentViewForScrollView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor).isActive = true
        contentViewForScrollView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor).isActive = true
        contentViewForScrollView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
    }
    
    func addConstraintsScrollView() {
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
  
    
    @objc func openSourceLink() {
        let openArticlVC = OpenArticleLinkWeb()
        openArticlVC.url = url
        navigationController?.pushViewController(openArticlVC, animated: true)
    }
    

}
