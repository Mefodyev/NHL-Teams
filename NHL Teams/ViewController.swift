//
//  ViewController.swift
//  NHL Teams
//
//  Created by Alexey Mefodyev on 11.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private let urlOfRoster = "https://statsapi.web.nhl.com/api/v1/teams/15/roster"
    
    @IBOutlet weak var toTheRosterButton: UIButton!
    @IBOutlet weak var copyrightLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchCopyright()
    }
    
    private func fetchCopyright() {
        guard let url = URL(string: urlOfRoster) else {
            print("Unavailable link")
            return
        }
        
        URLSession.shared.dataTask(with: url) {
            (data, _, _) in
            
            guard let data = data else {
                return
            }
            
            do {
                let JSONDescription = try JSONDecoder().decode(FullRoster.self, from: data)
                print(JSONDescription.copyright, JSONDescription.link)
                
                DispatchQueue.main.async {
                    self.copyrightLabel.text = JSONDescription.copyright
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}

