//
//  ViewController.swift
//  TheNewsApp
//
//  Created by Araz Muradov on 14.03.23.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    
    @IBAction func loginTap(_ sender: Any) {
        if let email = emailText.text, let password = passwordText.text, !email.isEmpty, !password.isEmpty {
            if password.count >= 5 && password.count <= 10 {
                UserDefaults.standard.set(true, forKey: "loggedIn")
                navigationController?.popViewController(animated: true)
                
            }else {
                showAlert(message: "Sifre yanlisdir")
            }
        } else {
            showAlert(message: "Melumatlar duzgun deyil")
            
        }
    }
    
    
    
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(cancel)
        present(alertController, animated: true)
    }
    
    @IBAction func registerTap(_ sender: Any) {
        let regisController = storyboard?.instantiateViewController(withIdentifier: "RegisterController") as! RegisterController
        navigationController?.show(regisController, sender: nil)
        
    }
    
}





