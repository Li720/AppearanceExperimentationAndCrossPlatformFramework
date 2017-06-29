import UIKit
import AVFoundation

class StartViewController: UIViewController {
    
    var startView: StartView! { return view as! StartView }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startView.showOptions()
    }
    
    @IBAction func userDidSelectStandard(_ sender: Any) {
        ThemeManager.apply(StandardTheme())
        self.performSegue(withIdentifier: "presentDealer", sender: sender)
    }
    
    @IBAction func userDidSelectEvil(_ sender: Any) {
        ThemeManager.apply(EvilTheme())
        self.performSegue(withIdentifier: "presentDealer", sender: sender)
    }
    
    @IBAction func userDidSelectXCode(_ sender: Any) {
        ThemeManager.apply(XcodeTheme())
        self.performSegue(withIdentifier: "presentDealer", sender: sender)
    }
    
    @IBAction func done(_ segue: UIStoryboardSegue) {
        self.dismiss(animated: true, completion: nil)
    }
}

