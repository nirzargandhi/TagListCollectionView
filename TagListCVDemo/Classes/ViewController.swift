//
//  ViewController.swift
//  TagListCVDemo
//
//  Created by Nirzar Gandhi on 12/02/24.
//

import UIKit
import TagsFlowLayout

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // MARK: - Properties
    fileprivate lazy var arrText = [String]()
    
    
    // MARK: -
    // MARK: - View init Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setControlsProperty()
        self.setData()
    }
    
    fileprivate func setControlsProperty() {
        
        // Collection View
        self.collectionView.backgroundColor = .clear
        self.collectionView.register(UINib(nibName: CollectionViewCell.ClassName, bundle: nil), forCellWithReuseIdentifier: CollectionViewCell.ClassName)
        self.collectionView.isScrollEnabled = true
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        let tagsFlowLayout = TagsFlowLayout(alignment: .left ,minimumInteritemSpacing: 10, minimumLineSpacing: 10, sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        self.collectionView.collectionViewLayout = tagsFlowLayout
    }
}


// MARK: - Call Back
extension ViewController {
    
    func setData() {
        
        let arrTemp = [
            "Antigua and Barbuda",
            "Bosnia and Herzegovina",
            "India",
            "USA",
            "India",
            "Congo",
            "UK Grenadines",
            "Congo (Congo-Brazzaville)",
            "China",
            "Sri-Lanka 1",
            "Sri-Lanka",
            "Democratic Republic of the Congo Democratic Republic of the Congo",
            "Israel and",
            "Saint Vincent and the Grenadines",
            "Namibia",
            "Saint Vincent and the Grenadines",
            "Oman Grenadines",
            "Oman",
            "Namibia"
        ]
        
        for text in arrTemp {
            
            var strText = text
            
            let screenWidth = UIScreen.main.bounds.width - 130 //collection Padding 40 + ImageView Leading 15 + ImageView Width 20 + Label Leading 10 + Label Trailing 15 + 3-Dot Size 30
            
            if self.getWidthtForLabel(strText) > screenWidth {
                
                while self.getWidthtForLabel(strText) > screenWidth {
                    strText = String(strText.dropLast())
                }
                
                self.arrText.append(strText.appending("..."))
            } else {
                self.arrText.append(strText)
            }
        }
        
        self.collectionView.reloadData()
    }
    
    func getWidthtForLabel(_ text:String) -> CGFloat {
        
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: CGFloat.greatestFiniteMagnitude, height: 50))
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.font = .systemFont(ofSize: 16)
        label.text = text
        label.sizeToFit()
        return label.frame.width
        
    }
}


// MARK: - UICollectionView DataSource
extension ViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrText.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.ClassName, for: indexPath) as! CollectionViewCell
        
        cell.configureCell(text: arrText[indexPath.row])
        
        return cell
    }
    
    // UICollectionView FlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    // UICollectionView Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) { }
}


// MARK: - NSObject
extension NSObject {
    
    var ClassName: String {
        return String(describing: type(of: self))
    }
    
    class var ClassName: String {
        return String(describing: self)
    }
}

