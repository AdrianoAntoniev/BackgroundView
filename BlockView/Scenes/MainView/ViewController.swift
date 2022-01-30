//
//  ViewController.swift
//  BlockView
//
//  Created by Adriano-R Vieira on 29/01/22.
//

import UIKit

class ViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)

        let myView = View(frame: UIScreen.main.bounds)
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        view = myView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @objc func buttonTapped(sender: UIButton) {
        let nav = UINavigationController(rootViewController: NextViewController())
        nav.modalPresentationStyle = .fullScreen

        self.present(nav, animated: true)
    }
}

