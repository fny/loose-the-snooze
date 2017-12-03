
import AVFoundation
import Foundation

class Alarm {
    static let sharedInstance = Alarm()
    var audioPlayer = AVAudioPlayer()
    init() {
        do {
            let audioPath = Bundle.main.path(forResource: "1", ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        }
        catch {
            //ERROR
        }
    }
    
    func start() {
        audioPlayer.play()
    }
    
    func stop() {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
    }
}
