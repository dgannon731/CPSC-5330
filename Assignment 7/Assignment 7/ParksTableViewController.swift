import UIKit

class ParksTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let parks = ParkData.allParks
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            title = "National Parks"
            
            tableView.dataSource = self
            tableView.delegate = self
        }
        
       
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showParkDetail" {
                guard let detailVC = segue.destination as? ParkDetailViewController,
                      let indexPath = tableView.indexPathForSelectedRow else {
                    return
                }
                
                let selectedPark = parks[indexPath.row]
                detailVC.park = selectedPark
            }
        }
    }

    // MARK: - UITableViewDataSource
    extension ParksTableViewController: UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return parks.count
        }
        
        func tableView(_ tableView: UITableView,
                       cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ParkCell",
                                                     for: indexPath)
            
            let park = parks[indexPath.row]
            cell.textLabel?.text = park.name
            cell.detailTextLabel?.text = park.location
            return cell
        }
    }

    // MARK: - UITableViewDelegate
    extension ParksTableViewController: UITableViewDelegate {
        
        func tableView(_ tableView: UITableView,
                       didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
