//
//  HomeController.swift
//  TheNewsApp
//
//  Created by Araz Muradov on 15.03.23.
//

import UIKit

class HomeController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource,UISearchBarDelegate{
    @IBOutlet weak var searchOutlet: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!

   //var delegate: DelegateProtocol?
    var news = [News]()
    var newsOriginal = [News]()
    var favorit = [Favorit]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchOutlet.delegate = self
        newsJsonRead()
    }
    
    func newsJsonRead() {
        if let jsonFile = Bundle.main.url(forResource: "Onboard", withExtension: "json"),
           let data = try? Data(contentsOf: jsonFile) {
            do {
                news = try JSONDecoder().decode([News].self, from: data)
                
                newsOriginal = news
                
                collectionView.reloadData()
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("File not found")
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        news.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsFirstCollectionViewCell", for: indexPath) as! NewsFirstCollectionViewCell
        cell.firstNewsImage.image = UIImage(named: news[indexPath.item].image)
        cell.newslabel.text = news[indexPath.item].title
        cell.timelabel.text = news[indexPath.item].category
        cell.favoriteNewsCallBack = {
            if UserDefaults.standard.bool(forKey: "loggedIn") {
                print("hi")
            } else {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                self.navigationController?.show(vc, sender: nil)
            }
            
           
        }
        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let articleController = self.storyboard?.instantiateViewController(withIdentifier: "ArticleController") as! ArticleController
        articleController.news = news[indexPath.item].article
        let imageName = news[indexPath.item].image
        if let image = UIImage(named: imageName) {
            articleController.selectedImage = image
            navigationController?.show(articleController, sender: nil)
        }
    }
   
    
    @IBAction func logout(_ sender: Any) {
        let alert = UIAlertController(title: "Warning", message: "Are you sure to log out?", preferredStyle: .alert)
           let yesAction = UIAlertAction(title: "Yes", style: .default) { (_) in
               if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let sceneDelegate = scene.delegate as? SceneDelegate {
                   UserDefaults.standard.set(false, forKey: "loggedIn")
                   sceneDelegate.setLoginRootController(windowScene: scene)
               }
           }
           let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
           alert.addAction(yesAction)
           alert.addAction(noAction)
           present(alert, animated: true, completion: nil)
            }
            
        @IBAction func list(_ sender: Any) {
            let listController = self.storyboard?.instantiateViewController(withIdentifier: "ListController") as! ListController
            navigationController?.show(listController, sender: nil)
            
        }
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            if searchText.isEmpty {
                news = newsOriginal
            } else {
                news = newsOriginal.filter({ item in
                    item.title.contains(searchText)
                })
            }
            collectionView.reloadData()
        }
        func rootController() {
            if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let sceneDelegate = scene.delegate as? SceneDelegate {
                UserDefaults.standard.set(false, forKey: "homNav2")
                sceneDelegate.setRootController(windowScene: scene)
            }
        }
    }

