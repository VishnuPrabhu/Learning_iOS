//
//  ViewController.swift
//  ReusableFrameworkTestApp
//
//  Created by Vishnu Prabhu Rama Chandran on 25/11/23.
//

import UIKit
import ReusableFramework

class ViewController: UIViewController {

    @IBOutlet weak var profileView: ProfileView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let logger = Logger()
        logger.log(LogType.info, message: "viewDidLoad called")
        
        profileView.image = UIImage(named: "marvels")
    }

    @IBAction func onButtonClick(_ sender: Any) {
        let alertView = RFAlertView(frame: self.view.bounds)
        alertView.set(image: UIImage(named: "marvels")!)
        alertView.set(headline: "Marvels")
        self.view.addSubview(alertView )
    }
    
    @IBAction func onNextButtonClick(_ sender: Any) {
        let nextVC = CustomViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

