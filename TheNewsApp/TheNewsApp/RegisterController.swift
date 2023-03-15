//
//  RegisterController.swift
//  TheNewsApp
//
//  Created by Araz Muradov on 14.03.23.
//

import UIKit
protocol DelegateProtocol{
    func setText(text:String)
}


class RegisterController: UIViewController {
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var birthdayText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    var delegate:DelegateProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    @IBAction func registerTap(_ sender: Any) {
        if let nameText = nameText.text, let passwordText = passwordText.text, !nameText.isEmpty, !passwordText.isEmpty {
            delegate?.setText(text: nameText)
            delegate?.setText(text: passwordText)
            if passwordText.count >= 5 && passwordText.count <= 10 {
                navigationController?.popViewController(animated: true)
                
            } else {
                print("Sifre yalnisdir")
            }
        }
        
    }
}
