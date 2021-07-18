//
//  RosterTableViewController.swift
//  NHL Teams
//
//  Created by Alexey Mefodyev on 12.07.2021.
//

import UIKit

class RosterTableViewController: UITableViewController {
    
    var players: [Roster] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPlayers()
        tableView.rowHeight = 100
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RosterTableViewCell

        cell.configureRoster(players[indexPath.row])
        
        return cell
    }
}

extension RosterTableViewController {
    
    private func fetchPlayers() {

        if let url = URL(string: urlOfRoster) {
            URLSession.shared.dataTask(with: url) {
                (data,_,_) in

                guard let data = data else { return }

                do {
                    let JSONDescription = try JSONDecoder().decode(FullRoster.self, from: data)
                    self.players = JSONDescription.roster
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                } catch {
                    let error = error
                    print("Something's wrong", error)
                }
            }.resume()
        } else {
            print("Invalid URL")
        }
    }
    
}
