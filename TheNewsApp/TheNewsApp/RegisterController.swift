//
//  RegisterController.swift
//  TheNewsApp
//
//  Created by Araz Muradov on 14.03.23.
//

import UIKit
class RegisterController: UIViewController {
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var birthdayText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    var users = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()
        readDataFromFile()
    }
    func getFilePath() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDirectory = paths[0]
        let path = docDirectory.appendingPathExtension("Users.json")
        print(path)
        return path
    }
    func writeToJsonFile() {
        do {
            let data = try JSONEncoder().encode(users)
            try data.write(to: getFilePath())
            navigationController?.popViewController(animated: true)
        } catch {
            print(error.localizedDescription)
        }
    }
    func readDataFromFile() {
        if let data = try? Data(contentsOf: getFilePath()) {
            do {
                users = try JSONDecoder().decode([User].self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("File not exist ")
        }
    }
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func registerTap(_ sender: Any) {
        if let nameText = nameText.text,
           let passwordText = passwordText.text,
           let birthdayText = birthdayText.text,
           let emailText = emailText.text,
           !nameText.isEmpty, !passwordText.isEmpty, !birthdayText.isEmpty,  !emailText.isEmpty {
            if passwordText.count >= 5 && passwordText.count <= 10 {
                users.append(.init(fullname: nameText, birthday: birthdayText, email: emailText, password: passwordText))
                
                //        if nameText.text == "" {
                //            makeAlert(titleInput: "", messageInput: "")
                //        } else if birthdayText.text ==  "" {
                //            makeAlert(titleInput: "", messageInput: "")
                //        } else if emailText.text == "" {
                //            makeAlert(titleInput: "", messageInput: "")
                //        } else if passwordText.text == "" {
                //            makeAlert(titleInput: "", messageInput: "")
                //        } else {
                
                //         users.append(User(fullname: nameText.text ?? "", birthday: birthdayText.text ?? "", email: emailText.text ?? "", password: passwordText.text ?? ""))
                
                
                writeToJsonFile()
                
            }
        }
    }
}
