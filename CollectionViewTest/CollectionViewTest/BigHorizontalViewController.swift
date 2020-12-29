//
//  BigHorizontalViewController.swift
//  CollectionViewTest
//
//  Created by 박진수 on 2020/12/29.
//

import UIKit

class BigHorizontalViewController: UIViewController {
    @IBOutlet weak var bigCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bigCollectionView.delegate = self
        bigCollectionView.dataSource = self
        
    }
    
}

extension BigHorizontalViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("BigHorizontal - cellForItemAt")
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bigHorizontalCell", for: indexPath) as? BigHorizontalCell {
            cell.index = indexPath.item
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 20, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    
}

class BigHorizontalCell: UICollectionViewCell {
    var index: Int = 0
    
    override func prepareForReuse() {
        super.prepareForReuse()
        print("\(index) BigHorizontalCell - prepareForReuse()\n ")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .blue
        //        self.contentView.backgroundColor = .black
        print("BigHorizontalCell - awakeFromNib()\n ")
    }
}
