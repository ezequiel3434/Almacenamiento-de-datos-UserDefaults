//
//  ViewController.swift
//  Almacenamiento de datos UserDefaults
//
//  Created by Ezequiel Parada Beltran on 29/06/2020.
//  Copyright © 2020 Ezequiel Parada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let kMyKey = "MY_KEY"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

// MARK: UserDefaults
    
    @IBAction func getButtonAction(_ sender: Any) {
        if let value = UserDefaults.standard.string(forKey: kMyKey) {
            showAlert(message: value)
        } else {
            showAlert(message: "No hay un valor para esta clave")
        }
    }
    
    @IBAction func putButtonAction(_ sender: Any) {
        
        UserDefaults.standard.set("Hola", forKey: kMyKey)
        UserDefaults.standard.synchronize()
        showAlert(message: "Hemos guardado un valor")
    }
    @IBAction func deleteButtonAction(_ sender: Any) {
        
        UserDefaults.standard.removeObject(forKey: kMyKey)
        UserDefaults.standard.synchronize()
        showAlert(message: "Hemos borrado un valor")
    }
    
    private func showAlert(message: String){
        let alert = UIAlertController(title: "MyUserDefaults", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

