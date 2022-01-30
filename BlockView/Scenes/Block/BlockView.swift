//
//  BlockView.swift
//  BlockView
//
//  Created by Adriano-R Vieira on 29/01/22.
//

import UIKit

class BlockView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        backgroundColor = .orange

        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Escondendo sua view 😎"
        label.textAlignment = .center
        label.font = .italicSystemFont(ofSize: 50)
        label.backgroundColor = .green
        label.numberOfLines = .zero

        addSubview(label)

        NSLayoutConstraint.activate(
            [
                label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
                label.centerYAnchor.constraint(equalTo: centerYAnchor)
            ]
        )
    }

}
