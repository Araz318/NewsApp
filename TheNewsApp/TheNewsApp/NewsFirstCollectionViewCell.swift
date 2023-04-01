//
//  NewsFirstCollectionViewCell.swift
//  TheNewsApp
//
//  Created by Araz Muradov on 15.03.23.
//

import UIKit
//protocol NewsFirstCollectionViewCellDelegate: AnyObject {
//    func presentAlertController(alert: UIAlertController)
//}



class NewsFirstCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var firstNewsImage: UIImageView!
    @IBOutlet weak var newslabel: UILabel!
    @IBOutlet weak var timelabel: UILabel!
   
    
    var favoriteNewsCallBack: (()->())?
   
    @IBAction func favoriteButton(_ sender: Any) {
     
            favoriteNewsCallBack?()
       
    }
}

    

