//
//  MangaDetailView.swift
//  AnimeListLuciana
//
//  Created by  Luciana Fernandes de Oliveira on 21/10/23.
//

import UIKit

protocol MangaDetailViewProtocol {
    func openView()
}

class MangaDetailView: UIView {
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.bounces = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var contentView: UIView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var mainView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.layoutMargins = .init(top: .zero, left: .zero, bottom: .zero, right: .zero)
        view.isLayoutMarginsRelativeArrangement = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Comentario: \(model.excerpt ?? String())"
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var openButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Abrir", for: .normal)
        view.backgroundColor = .gray
        view.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        view.heightAnchor.constraint(equalToConstant: 48).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var seeButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Ver", for: .normal)
        view.backgroundColor = .gray
        view.addTarget(self, action: #selector(seeButtonAction), for: .touchUpInside)
        view.heightAnchor.constraint(equalToConstant: 48).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var delegate: MangaDetailViewProtocol?
    private var model: MangaDetailResponse

    init(model: MangaDetailResponse, delegate: MangaDetailViewProtocol?) {
        self.model = model
        self.delegate = delegate
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func buttonAction() {
        if let url = URL(string: model.url ?? String()) {
            UIApplication.shared.open(url)
        }
    }
    
    @objc
    func seeButtonAction() {
        delegate?.openView()
    }
}

extension MangaDetailView: ViewCodable {
    func buildHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(mainView)
        mainView.addArrangedSubview(titleLabel)
        mainView.addArrangedSubview(openButton)
        mainView.addArrangedSubview(seeButton)
    }
  
    func setupConstraints() {
        var scrollHeightAnchor: NSLayoutDimension
        var scrollWidthAnchor: NSLayoutDimension
        scrollHeightAnchor = contentView.heightAnchor
        scrollWidthAnchor = safeAreaLayoutGuide.widthAnchor
        
        let contentHeightConstraint = contentView.heightAnchor.constraint(equalTo: scrollHeightAnchor)
        contentHeightConstraint.priority = .defaultLow
        let contentWidthConstraint = contentView.widthAnchor.constraint(equalTo: scrollWidthAnchor)
        contentWidthConstraint.priority = .required
        
        NSLayoutConstraint.activate([
            contentHeightConstraint,
            contentWidthConstraint,
        ])
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
