//
//  MenuViewController.swift
//  Sales Assistant
//

//  Copyright © 2017 RoomBoys. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    @IBOutlet var tableview:UITableView!
    var DatasourceArr:Array = ["Customer","Product","Sales Rep"]
    var ImgArry:Array = ["cust","prodct","salesRep"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.splitViewController?.delegate=self
        self.splitViewController?.preferredDisplayMode = .primaryOverlay
  
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("\(tableview.contentOffset)")
        
    }
    

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "detail")
        {
            
        }
     }
    

}
extension MenuViewController:UISplitViewControllerDelegate
{
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}

extension UISplitViewController {
    func toggleMasterView() {
        let barButtonItem = self.displayModeButtonItem
        UIApplication.shared.sendAction(barButtonItem.action!, to: barButtonItem.target, from: nil, for: nil)
    }
}

extension MenuViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return
         DatasourceArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell:MainMenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as! MainMenuTableViewCell
        Cell.title.text = "\(DatasourceArr[indexPath.row])"
        Cell.img.image=UIImage(named: "\(ImgArry[indexPath.row])")
        return Cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(indexPath.row == 1)
        {
                self.performSegue(withIdentifier: "NextView", sender: self)
            
        }
        else
        {
            let alert = UIAlertController(title: "Comming Soon...", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
                // perhaps use action.title here
            })
            self.present(alert, animated: true)
        }
        
    }
    
}
