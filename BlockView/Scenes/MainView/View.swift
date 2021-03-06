//
//  View.swift
//  BlockView
//
//  Created by Adriano-R Vieira on 29/01/22.
//

import UIKit

class View: UIView {
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
