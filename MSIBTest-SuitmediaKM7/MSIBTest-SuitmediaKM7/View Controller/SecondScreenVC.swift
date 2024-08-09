//
//  SecondScreenVC.swift
//  MSIBTest-SuitmediaKM7
//
//  Created by rifqi triginandri on 09/08/24.
//

import UIKit

class SecondScreenVC: UIViewController{
    
    @IBOutlet weak var label_name: UILabel!
    @IBOutlet weak var label_selected_user: UILabel!
    
    @IBOutlet weak var button_choose_user: UIButton!
    
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        if let name = name{
            label_name.text = name
        }
    }
    
    
    @IBAction func choose_user(_ sender: Any) {
        let thirdView = storyboard?.instantiateViewController(identifier: "ThirdView") as! ThirdScreenVC
        self.navigationController?.pushViewController(thirdView, animated: true)

    }
    
}
