import UIKit
import logic

private let reuseIdentifier = "CardCollectionViewCell"

class DealViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    let standardDeck = StandardDeck()
    @IBOutlet var collectionView : UICollectionView!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return standardDeck.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CardCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CardCollectionViewCell
        cell.configure(with: standardDeck[indexPath.row])
        // Configure the cell
    
        return cell
    }

}
