//
//  ViewController.swift
//  CADisplayLink_Test
//
//  Created by 김부성 on 2022/05/23.
//

import UIKit

final class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    createDisplayLink()
    // Do any additional setup after loading the view.
  }
  
  func createDisplayLink() {
    let displayLink: CADisplayLink = CADisplayLink.init(target: self, selector: #selector(stamp(displaylink:)))
    // 주사율 제한
    displayLink.preferredFrameRateRange = CAFrameRateRange.init(minimum:8, maximum:15, preferred:0)
    displayLink.add(to: .main, forMode: RunLoop.Mode.default)
  }
  
  @objc func stamp(displaylink: CADisplayLink) {
    print("\(displaylink.timestamp) displayUpdated \(displaylink.duration)")
    let actualFramesPerSecond = 1 / (displaylink.targetTimestamp - displaylink.timestamp)
    print("actualFrame \(actualFramesPerSecond)")
  }

}

