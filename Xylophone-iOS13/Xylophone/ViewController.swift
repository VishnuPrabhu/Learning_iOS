import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        playButtonAnimation(sender)
        playSound(sender.currentTitle!)
    }
    
    func playSound(_ key: String) {
        let url = Bundle.main.url(forResource: key, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    func playButtonAnimation(_ button: UIButton) {
        button.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            button.alpha = 1.0
        }
    }
}
