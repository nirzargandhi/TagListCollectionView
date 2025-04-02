//
//  CollectionViewCell.swift
//  TagListCVDemo
//
//  Created by Nirzar Gandhi on 26/02/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    
    // MARK: - Cell init methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .clear
        
        // Container
        self.container.backgroundColor = .clear
        self.container.layer.cornerRadius = 20.0
        self.container.layer.borderWidth = 1.0
        self.container.layer.borderColor = UIColor.black.cgColor
        
        // Image View
        self.imgView.backgroundColor = .black
        self.imgView.contentMode = .scaleToFill
        
        // Label
        self.label.backgroundColor = .clear
        self.label.textColor = .black
        self.label.font = .systemFont(ofSize: 16)
        self.label.numberOfLines = 1
        self.label.lineBreakMode = .byTruncatingTail
        self.label.text = ""
    }
    
    
    // MARK: - Cell Configuration
    func configureCell(text : String) {
        
        // Label
        self.label.text = ""
        if text.count > 0 {
            self.label.text = text
        }
    }
}
