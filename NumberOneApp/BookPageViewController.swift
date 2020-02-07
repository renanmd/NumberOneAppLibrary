//
//  BookPageViewController.swift
//  NumberOneApp
//
//  Created by Renan Diniz on 25/07/19.
//  Copyright © 2019 RMD Goup. All rights reserved.
//

import UIKit

class BookPageViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet private weak var bookPageImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var bookInfo: BookInfo!
    var bookPageImageName: String!
    var pageNumber: Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bookPageImage.image = UIImage(named: self.getFullImageName(pageName: self.bookPageImageName, pageNumber: self.pageNumber))
        
        title = bookPageImageName
        
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 6.0
    }
    
    private func getFullImageName(pageName: String, pageNumber: Int) -> String {
        let fullImageName = "\(pageName)\(String(format: "%05d", pageNumber))"
        return fullImageName
    }
    
    @IBAction func showNext(){
        pageNumber = pageNumber + 1
        
        bookPageImage.image = UIImage(named: self.getFullImageName(pageName: self.bookPageImageName, pageNumber: self.pageNumber))
    }
    
    @IBAction func showPrevious(){
        
        pageNumber = pageNumber - 1
        
        bookPageImage.image = UIImage(named: self.getFullImageName(pageName: self.bookPageImageName, pageNumber: self.pageNumber))
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.bookPageImage
    }
}
