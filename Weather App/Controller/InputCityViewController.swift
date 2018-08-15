//
//  InputCityViewController.swift
//  Weather App
//
//  Created by Pandu Abbiyuarsyah on 15/08/18.
//  Copyright © 2018 Blanja. All rights reserved.
//

import UIKit
import SDWebImage

class InputCityViewController: UIViewController {

    @IBOutlet weak var tfCity: UITextField!
    @IBOutlet weak var imgBackground: UIImageView!
    
    var delegate: ChangeCityDelegate?
    var urlImg: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgBackground.sd_setImage(with: URL(string: urlImg!), completed: nil)
        self.view.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.tintColor = UIColor.black
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnPressed(_ sender: UIButton) {
        let cityName = tfCity.text!
        delegate?.userEnteredANewCityName(city: cityName)
        self.navigationController?.popViewController(animated: true)
        
    }
}

protocol ChangeCityDelegate {
    func userEnteredANewCityName(city: String)
}

