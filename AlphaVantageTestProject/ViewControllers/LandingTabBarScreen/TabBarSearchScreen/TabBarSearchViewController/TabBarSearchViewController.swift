//
//  TabBarSearchViewController.swift
//  AlphaVantageTestProject
//
//  Created by DynamologicSolutions on 22/12/2021.
//

import UIKit

class TabBarSearchViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
   
    

    let modelObject : TabBarSearchViewModelClass = TabBarSearchViewModelClass.init()
    @IBOutlet weak var searchTbview: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.activityIndicator.isHidden = true
        
        self.modelObject.searchDidPerformBlock = { (success,result) in
            self.activityIndicator.isHidden = true
            self.activityIndicator.stopAnimating()
            self.searchTbview.isHidden = false
            self.searchTbview.reloadData()
            
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    //MARK: - TableView -
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.modelObject.searchResultArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : TabBarSearchViewControllerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TabBarSearchViewControllerTableViewCell
        
        
        let dataObject = self.modelObject.searchResultArray[indexPath.row]
        
        cell.nameLb.text = dataObject.name
        cell.symbolLb.text = dataObject.symbol
        cell.symbolData = dataObject
        cell.favBtn.isSelected = dataObject.isFavourite
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dataObject = self.modelObject.searchResultArray[indexPath.row]
        let vc : SymbolReportingViewController = SymbolReportingViewController.init(nibName: "SymbolReportingViewController", bundle: Bundle.main)
        vc.symbolData = dataObject
        self.present(vc, animated: true, completion: nil)
        
    }
    
    
    
    //MARK: - Search bar -
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        self.searchTbview.isHidden = true
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        self.modelObject.searchTermDidChange(SearchTerm: searchText)
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchTbview.isHidden = true
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        self.modelObject.searchTermDidChange(SearchTerm: "")
    }

}
