//
//  Dialog.swift
//  Weather App
//
//  Created by Pandu Abbiyuarsyah on 15/08/18.
//  Copyright © 2018 Blanja. All rights reserved.
//

import SVProgressHUD

class Dialog: SVProgressHUD {
    
    class func showProgressDialog(info: String) {
        setMinimumSize(CGSize(width: 150, height: 150))
        show()
    }
    
    class func dismissProgressDialog() {
        dismiss()
    }
    
    class func showSuccessDialog(info: String){
        setMinimumSize(CGSize(width: 150, height: 150))
        showSuccess(withStatus: info)
        dismiss(withDelay: 1)
    }
    
    class func showFailedDialog(info: String) {
        setMinimumSize(CGSize(width: 150, height: 150))
        showError(withStatus: info)
        dismiss(withDelay: 1.5)
    }
    
    class func showInfoDialog(info: String) {
        setMinimumSize(CGSize(width: 300, height: 100))
        showInfo(withStatus: info)
        dismiss(withDelay: 1.5)
    }

}

