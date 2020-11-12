//
//  ViewController.swift
//  HomeWork07
//
//  Created by 3droot on 05.11.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var hiddenLabel: UILabel!
    
     var user = User()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(hadleDidFillFullName(notification:)), name: .didFillFullName, object: nil)
    }
   

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let destinationVC = segue.destination as? SecondViewController else { return}
        destinationVC.user = user
    }
    
   @objc func hadleDidFillFullName(notification: Notification){
    if let fullName = notification.object as? User{
        hiddenLabel.isHidden  = false
        hiddenLabel.text = fullName.name + " " + fullName.surname
    }
    }
    
    @IBAction func continueAction(_ sender: UIButton) {
        guard let text = nameTextField.text else {return}
        if text == "" {
            let alert = UIAlertController(title: "Ошибка в имени", message: "Пожалуйста, добавьте имя", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else{
            user.name = text
            nameTextField.text = ""
            performSegue(withIdentifier: "showSecond", sender: nil)
        }
    }
    

}


    
    

