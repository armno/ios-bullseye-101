//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Armno Prommarak on 12/1/2558 BE.
//  Copyright © 2558 armno. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
  
  @IBOutlet weak var webView: UIWebView!
  
  @IBAction func close() {
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let htmlFile = NSBundle.mainBundle().pathForResource("BullsEye", ofType: "html") {
      
      if let htmlData = NSData(contentsOfFile: htmlFile) {
        let baseUrl = NSURL(fileURLWithPath: NSBundle.mainBundle().bundlePath)
        webView.loadData(htmlData, MIMEType: "text/html", textEncodingName: "UTF-8", baseURL: baseUrl)
      }
    }
  }

}
