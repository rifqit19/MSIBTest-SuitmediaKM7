//
//  FirstScreenVC.swift
//  MSIBTest-SuitmediaKM7
//
//  Created by rifqi triginandri on 09/08/24.
//

import Foundation
import UIKit

class FirstScreenVC: UIViewController {

    @IBOutlet weak var image_profile: UIImageView!
    
    @IBOutlet weak var field_name: UITextField!
    @IBOutlet weak var field_palindrome: UITextField!
    
    @IBOutlet weak var button_check: UIButton!
    @IBOutlet weak var button_next: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

    }
    
    @IBAction func buttonClicked(_ sender: UIButton)
    {
        switch sender{
        case button_check:
            let sentence = field_palindrome.text ?? ""
            showMessage(sentence.isPalindrome())
        case button_next:
            let secondView = storyboard?.instantiateViewController(identifier: "SecondView") as! SecondScreenVC
            secondView.name = field_name.text
            self.navigationController?.pushViewController(secondView, animated: true)
        default:
            break
        }
    }
}


//MARK: -Extension Section
extension FirstScreenVC{
    
    func showMessage(_ isPalindrome: Bool){
        let message = isPalindrome ? "isPalindrome" : "not palindrome"
        let alert = UIAlertController(title: "Palindrome Check", message: message, preferredStyle: .alert)
        let actionButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(actionButton)
        present(alert, animated: true, completion: nil)
    }
    
}

