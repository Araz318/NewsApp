//
//  ListController.swift
//  TheNewsApp
//
//  Created by Araz Muradov on 25.03.23.
//

import UIKit


class ListController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  

    
    var array = ["kriminal", "Sports", "Business","General"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = array[indexPath.row]
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let homeController = self.storyboard?.instantiateViewController(withIdentifier: "HomeController") as!   HomeController
       
       
       
        navigationController?.popViewController(animated: true)
    }


}
