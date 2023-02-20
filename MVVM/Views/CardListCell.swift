//
//  CardListCell.swift
//  MVVM
//
//  Created by Ильдар Аглиуллов on 19.02.2023.
//

import UIKit
import Kingfisher

final class CardListCell: UITableViewCell {
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 16.0
        return stackView
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.spacing = 10.0
        return stackView
    }()
    
    private lazy var cardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = #imageLiteral(resourceName: "card-placeholder")
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 4
        label.font = .preferredFont(forTextStyle: .caption1)
        label.textColor = .secondaryLabel
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.selectionStyle = .none
        configureLayout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.cardImageView.image = nil
        self.titleLabel.text = nil
    }
}

private extension CardListCell {
    
    func configureLayout() {
        self.backgroundColor = .secondarySystemGroupedBackground
        
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(typeLabel)
        contentStackView.addArrangedSubview(descriptionLabel)
        mainStackView.addArrangedSubview(cardImageView)
        mainStackView.addArrangedSubview(contentStackView)
        
        contentView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 16.0),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 16.0),
            contentView.layoutMarginsGuide.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: 16.0),
            contentView.layoutMarginsGuide.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 16.0),
            
            cardImageView.heightAnchor.constraint(equalToConstant: 246.0),
            cardImageView.widthAnchor.constraint(equalToConstant: 168.0)
        ])
    }
}

extension CardListCell {
    
    func configure(info: (name: String, type: String, desc: String, imageURL: String?)) {
        self.titleLabel.text = info.name
        self.typeLabel.text = info.type
        self.typeLabel.textColor = UIColor.typeColor(type: info.type)
        self.descriptionLabel.text = info.desc
        guard let urlString = info.imageURL, let imageURL = URL(string: urlString) else { return }
        self.cardImageView.kf.setImage(with: imageURL, placeholder: #imageLiteral(resourceName: "card-placeholder"))
    }
}
