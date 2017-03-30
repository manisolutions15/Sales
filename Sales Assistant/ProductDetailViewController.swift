//
//  ProductDetailViewController.swift
//  Sales Assistant
//

//  Copyright © 2017 RoomBoys. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {

    var ImgArry:Array = ["product 1","product 2","product 3","product 4","product 5"]
    @IBOutlet weak var displayImg:UIImageView!
    @IBOutlet weak var detailBtn:UIButton!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var index:Int? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        displayImg.image = UIImage(named: "\(ImgArry[appDelegate.inx])")
        detailBtn.layer.cornerRadius = 25
        detailBtn.clipsToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
