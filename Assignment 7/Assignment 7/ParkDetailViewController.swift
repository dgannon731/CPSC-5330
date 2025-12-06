import UIKit

class ParkDetailViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var parkImageView: UIImageView!
    
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    // MARK: - Model
    var park: Park?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let park = park {
            title = park.name
            locationLabel.text = park.location
            descriptionLabel.text = park.shortDescription
            
           
            parkImageView.image = UIImage(named: park.imageName)
        }
        
        descriptionLabel.numberOfLines = 0
    }
}
