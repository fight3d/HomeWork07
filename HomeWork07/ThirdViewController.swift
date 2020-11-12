//
//  ThirdViewController.swift
//  HomeWork07
//
//  Created by 3droot on 07.11.2020.
//

import UIKit



class ThirdViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    
    var user = User()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillLabels()
        
    }
 
    func fillLabels(){
        nameLabel.text = user.name
        surnameLabel.text = user.surname
    }

    @IBAction func saveAction(_ sender: UIButton) {
        let notification = Notification(name: .didFillFullName, object: user, userInfo: nil)
        NotificationCenter.default.post(notification)
        guard let firstController = self.navigationController?.viewControllers[0] else {return}
        self.navigationController?.popToViewController(firstController, animated: true)
    }
    
}

extension Notification.Name {
    static let didFillFullName = Notification.Name("didFillFullName")
}
