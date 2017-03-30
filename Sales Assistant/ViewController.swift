//
//  ViewController.swift
//  Sales Assistant
//

//  Copyright © 2017 RoomBoys. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var menuTab:UITableView!
    
    var Datasource:Array=["All Electronics","Home appliances","Laptops","Hard Drives","Sweet Foods","Tools"]
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTab.delegate = self
        menuTab.dataSource = self
     }
    
      override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "detail")
        {
            let index = self.menuTab.indexPathForSelectedRow
            let nav = segue.destination as! UINavigationController
            let VC = nav.viewControllers[0] as! DetailViewController
            VC.TitleText="\(Datasource[(index?.row)!])"
             self.menuTab.deselectRow(at: index!, animated: true)
        }
        
    }


}
extension ViewController:UITableViewDataSource,UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Datasource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCellID") as! MenuTableViewCell
        cell.menuTitle.text = "\(Datasource[indexPath.row])"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.splitViewController?.toggleMasterView()
        self.performSegue(withIdentifier: "detail", sender: self)
    }
    
}

