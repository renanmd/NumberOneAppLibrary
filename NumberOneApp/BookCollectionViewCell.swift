//
//  BookCollectionViewCell.swift
//  NumberOneApp
//
//  Created by Renan Diniz on 23/07/19.
//  Copyright © 2019 RMD Goup. All rights reserved.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var mainImage: UIImageView!
    
    var bookCoverImage: BookInfo? {
        didSet {
            if let bookCover = bookCoverImage {
                mainImage.image = UIImage(named: bookCover.coverImageName)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.prepareForReuse()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.mainImage.image = nil
    }
    
    public func setup(bookInfo: BookInfo) {
        self.mainImage.image = UIImage(named: bookInfo.coverImageName)
    }
}
