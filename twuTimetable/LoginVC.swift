//
//  LoginVC.swift
//  twuTimetable
//
//  Created by Jack Park on 2020-05-21.
//

import UIKit
import WebKit

class LoginVC: UIViewController {
    
    @IBOutlet var webview: WKWebView!
    
    @IBAction func makeButtonClicked(_ sender: Any) {
        
        webview.evaluateJavaScript("document.getElementsByTagName('html')[0].innerHTML", completionHandler: { (innerHTML, error) in
            let htmlText = "\(innerHTML)"
            print(htmlText)
            let newTimetable = Timetable()
            newTimetable.scrape(html_text: htmlText)
            
            
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://ics.twu.ca")!
        let request = URLRequest(url: url)
        webview.load(request)
    }
    

    
    
}
