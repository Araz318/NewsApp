//
//  FavoriteController.swift
//  TheNewsApp
//
//  Created by Araz Muradov on 15.03.23.
//

import UIKit

class ArticleController: UIViewController  {
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var text2: UITextView!
    
    var news = ""
    var selectedImage: UIImage?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        text2.text = news
        image2.image = selectedImage
        
        
    }
    
    


}
