//
//  DetailViewController.swift
//  Sales Assistant
//

//  Copyright © 2017 RoomBoys. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var prdTab:UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var DetailLbl: UILabel!
    
    var PrdName:Array=["iPhone","Macbook","Apple TV","iPad - Black","iPad - White"]
    var ImgArry:Array = ["product 1","product 2","product 3","product 4","product 5"]
    var PrdtId:Array = ["354235","78877","36244","65745","98675"]
    var PrdtPrice:Array = ["$ 453","$ 763","$ 318","$ 234","$ 544"]
    var PrdtStock:Array = ["10 in Stock","4 in Stock","7 in Stock","12 in Stock","6 in Stock"]
    

    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var TitleText:String=String()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("the select Title : \(TitleText)")
        
        if(TitleText == "")
        {
            prdTab.isHidden = true
        }
        else
        {
            prdTab.isHidden = false
        }
        
        DetailLbl.isHidden = true
        DetailLbl.text = TitleText
        prdTab.delegate = self
        prdTab.dataSource = self
    
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PrdName.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell:ProductTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as! ProductTableViewCell
        
        Cell.productTitle.text = "\(PrdName[indexPath.row])"
        Cell.productImg.image = UIImage(named: "\(ImgArry[indexPath.row])")
        Cell.prdID.text = "\(PrdtId[indexPath.row])"
        Cell.prdPrice.text = "\(PrdtPrice[indexPath.row])"
        Cell.prdStock.text = "\(PrdtStock[indexPath.row])"
        
        return Cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        appDelegate.inx = indexPath.row
        self.performSegue(withIdentifier: "ProductDetail", sender: self)
        print("selected index : \(indexPath.row)")
    }
    
    @IBAction func MenuAct(_ sender: UIBarButtonItem) {
        self.splitViewController?.toggleMasterView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ProductDetail")
        {
           
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 
}
