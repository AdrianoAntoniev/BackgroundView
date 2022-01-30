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

        let batataView = BatataView(frame: UIScreen.main.bounds)
        batataView.translatesAutoresizingMaskIntoConstraints = false
        batataView.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        view = batataView
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

class BatataView: UIView {
    lazy var button: UIButton = {
        let btn = UIButton(frame: .zero)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 10
        btn.backgroundColor = .orange
        btn.setTitle("Click me to next screen!", for: .normal)

        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .magenta
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addSubview(button)

        NSLayoutConstraint.activate(
            [
                button.heightAnchor.constraint(equalToConstant: 300),
                button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
            ]
        )
    }
}
