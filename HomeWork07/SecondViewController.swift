//
//  SecondViewController.swift
//  HomeWork07
//
//  Created by 3droot on 07.11.2020.
//

import UIKit



class SecondViewController: UIViewController {

    @IBOutlet weak var surnameTextField: UITextField!
    
     var user = User()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let destinationVC = segue.destination as? ThirdViewController else { return}
        destinationVC.user = user
    }
    
    @IBAction func continueAction(_ sender: UIButton) {
        guard let text = surnameTextField.text else {return}
        if text == "" {
            let alert = UIAlertController(title: "Ошибка в фамилии", message: "Пожалуйста, добавьте фамилию", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else{
            user.surname = text
            surnameTextField.text = ""
            performSegue(withIdentifier: "showThird", sender: nil)
        }
    }
    

}
