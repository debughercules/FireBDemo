//
//  FBDVCHome.swift
//  FireBaseDemo
//
//  Created by Bharat Byan on 8/4/17.
//  Copyright © 2017 Bharat Byan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class FBDVCHome: UIViewController {

    @IBOutlet weak var lblMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if UserDefaults.standard.bool(forKey: "IS_LOGIN") {
            
        }else{
            openLogin()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func openLogin(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vcFBDVCLogin = storyBoard.instantiateViewController(withIdentifier: "Login") as! FBDVCLogin
        let navFBDVCLogin: UINavigationController = UINavigationController(rootViewController: vcFBDVCLogin)
        self.present(navFBDVCLogin, animated:true, completion:nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func actBtnLogOut(_ sender: Any) {
        
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                self.openLogin()
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        
    }

}
