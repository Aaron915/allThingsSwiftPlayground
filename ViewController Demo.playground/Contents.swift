//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blueColor()
    }
}


class AViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.greenColor()
    }
}

class SecondViewController: FirstViewController, RedAnimationViewController {
    
}

class BViewController: AViewController, RedAnimationViewController {
    
}

protocol RedAnimationViewController: class {
    
    var view: UIView! { get set }
}

extension RedAnimationViewController {
    func animateToRed() {
        UIView.animateWithDuration(2) { [weak self] in
            self?.view.backgroundColor = UIColor.redColor()
        }
    }
}

//Can substitue SeconViewController here
let animationViewController : RedAnimationViewController = BViewController()
animationViewController.view.frame = CGRect(x: 0, y: 0, width: 300, height: 300)

XCPlaygroundPage.currentPage.liveView = animationViewController.view

animationViewController.animateToRed()

