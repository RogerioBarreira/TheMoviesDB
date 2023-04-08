//
//  HomeMoviesView.swift
//  TheMoviesDB
//
//  Created by Rogerio Martins on 08/04/23.
//

import UIKit

class HomeMoviesView: UIView {
    
    let viewBackGround: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.systemBlue.cgColor
        view.layer.cornerRadius = 12
        view.layer.shadowColor = UIColor.systemBlue.cgColor
        view.layer.shadowOffset = CGSize(width: 5, height: 7)
        view.layer.shadowOpacity = 0.9
        view.layer.shadowRadius = 3
        return view
    }()
    
    let buttonEnter: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30, weight: .bold)
        button.backgroundColor = .clear
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configConstraints() {
        setupViewBackGround()
        setupButton()
    }
    
    private func setupViewBackGround() {
        addSubview(viewBackGround)
        NSLayoutConstraint.activate([
            viewBackGround.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            viewBackGround.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            viewBackGround.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            viewBackGround.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setupButton() {
        viewBackGround.addSubview(buttonEnter)
        NSLayoutConstraint.activate([
            buttonEnter.centerXAnchor.constraint(equalTo: viewBackGround.centerXAnchor),
            buttonEnter.centerYAnchor.constraint(equalTo: viewBackGround.centerYAnchor),
            buttonEnter.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}
