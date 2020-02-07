//
//  ViewController.swift
//  NumberOneApp
//
//  Created by Renan Diniz on 15/07/19.
//  Copyright © 2019 RMD Goup. All rights reserved.
//

import UIKit

class BooksViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var bookInfos: [BookInfo]!;
    let cellIdentifier = "BookCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Books"
        self.bookInfos = (try? Array(fileName: "numberOneApp")) ?? [BookInfo]()
        self.collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowBookInfo" {
            if let cell = sender as? BookCollectionViewCell, let indexPath = collectionView.indexPath(for: cell), let dest = segue.destination as? TableViewController {
                dest.bookInfo = bookInfos[indexPath.item]
            }
        }
    }
    
    private func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        //let nib = UINib(nibName: "BookCell", bundle: nil)
        //collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookInfos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let bookInfo = self.bookInfos[indexPath.item]
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCell", for: indexPath) as? BookCollectionViewCell {
            cell.setup(bookInfo: bookInfo)
            
            return cell
        }
        
        return UICollectionViewCell()
    }
}
