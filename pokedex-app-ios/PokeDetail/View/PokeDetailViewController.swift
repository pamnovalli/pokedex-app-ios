//
//  PokeDetailViewController.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 25/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit 

class PokeDetailViewController: UIViewController {
    @IBOutlet private weak var pokeImage: UIImageView!
    @IBOutlet private weak var lblHeight: UILabel!
    @IBOutlet private weak var lblType: UILabel!
    @IBOutlet private weak var lblWeight: UILabel!
    @IBOutlet private weak var stackAbilities: UIStackView!
    @IBOutlet private weak var lblAtack: UILabel!
    @IBOutlet private weak var lblDefense: UILabel!
    @IBOutlet private weak var lblSpeed: UILabel!
    @IBOutlet private weak var statsView: UIView!
    
    private let presenter: PokeDetailPresenter

    init(presenter: PokeDetailPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
        statsView.layer.cornerRadius = 5
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.loadPokeDetail()
    }
}

extension PokeDetailViewController: PokeDetailPresenterDelegate {
    func setImage(_ image: String) {
        pokeImage.load(url: URL(string: image) ?? URL.init(fileURLWithPath: ""))
    }
    

    func setSpeed(_ speed: String) {
        lblSpeed.text = speed
    }
    
    func setDefence(_ defence: String) {
        lblDefense.text = defence
    }
    
    func setAttack(_ attack: String) {
        lblAtack.text = attack
    }
    
    func setHeight(_ height: String) {
        lblHeight.text = height
    }
    
    func setWeight(_ weight: String) {
        lblWeight.text = weight
    }
    
    func setType(_ type: String) {
        lblType.text = type
    }
    
    func setTitle(_ pokeName: String) {
        self.title = pokeName
    }
    
    func setAbilities(_ abilities: [String]) {
        for ability in abilities {
            let button = UIButton()
            button.setTitle(ability, for: .normal)
            button.backgroundColor = UIColor.random()
            button.titleLabel?.textColor =  UIColor.white
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            button.layer.cornerRadius = 5
            self.stackAbilities.addArrangedSubview(button)
            self.stackAbilities.addArrangedSubview(button)
        }
    }
}

extension UIColor {
  static func random () -> UIColor {
    return UIColor(
      red: CGFloat.random(in: 0...1),
      green: CGFloat.random(in: 0...1),
      blue: CGFloat.random(in: 0...1),
      alpha: 1.0)
  }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
