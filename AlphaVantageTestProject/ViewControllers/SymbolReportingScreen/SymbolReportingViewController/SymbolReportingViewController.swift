//
//  SymbolReportingViewController.swift
//  AlphaVantageTestProject
//
//  Created by DynamologicSolutions on 22/12/2021.
//

import UIKit

class SymbolReportingViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var symbolData : SymbolDataClass?
    let modelObject : SymbolReportingViewModelClass = SymbolReportingViewModelClass.init()
    
    @IBOutlet weak var reportingTbview: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var favBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.favBtn.isSelected = symbolData?.isFavourite ?? false
        
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        self.reportingTbview.isHidden = true
        
        titleLb.text = symbolData?.symbol ?? "Null"
        
        
        self.modelObject.reportingDidPerformBlock = { (success,result) in
            
            self.activityIndicator.isHidden = true
            self.activityIndicator.stopAnimating()
            self.reportingTbview.isHidden = false
            self.reportingTbview.reloadData()
        }
        
        
        let cellNib = UINib.init(nibName: "SymbolReportingViewControllerTableviewCell", bundle: Bundle.main)
        self.reportingTbview.register(cellNib, forCellReuseIdentifier: "cell")
        
        self.modelObject.loadData(Type: .Daily, Symbol: symbolData?.symbol ?? "")
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : SymbolReportingViewControllerTableviewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SymbolReportingViewControllerTableviewCell
        
        
        let dataObject = self.modelObject.searchResultArray[indexPath.row]

        cell.timeLb.text = dataObject.timestamp
        cell.hightLb.text = dataObject.hightString
        cell.lowLb.text = dataObject.lowString
        cell.openLb.text = dataObject.openString
        cell.closeLb.text = dataObject.closeString
        cell.volumeLb.text = dataObject.volumeString
        
        
        return cell
        
        
    }
    
    //MARK: - Actions -
    
    @IBAction func doneAction(_ sender: UIButton)
    {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelAction(_ sender: UIButton)
    {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func favAction(_ sender: UIButton)
    {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected
        {
            symbolData?.isFavourite = true
            AppDataStore.shared().local.addBookmarkForCurrentUser(Symbol: symbolData!)
        }
        else
        {
            symbolData?.isFavourite = false
            AppDataStore.shared().local.removeFavouriteForCurrentUser(Symbol: symbolData!)
        }
        
    }
    @IBAction func segmentedControlDidChange(_ sender: UISegmentedControl)
    {
        
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        self.reportingTbview.isHidden = true
        
        switch sender.selectedSegmentIndex
        {
        case 0 :
            self.modelObject.loadData(Type: .Daily, Symbol: symbolData?.symbol ?? "")
        case 1 :
            self.modelObject.loadData(Type: .Weekly, Symbol: symbolData?.symbol ?? "")
        case 2:
            self.modelObject.loadData(Type: .Monthly, Symbol: symbolData?.symbol ?? "")
        default:
            print("Invalid selection on segmented Control")
        }
        
        
    }
}
