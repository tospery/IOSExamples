//
//  CaseCell.swift
//  IOSExamples
//
//  Created by liaoya on 2022/11/15.
//

import UIKit
import ReactorKit
import HiIOS

class CaseCell: BaseTableCell, ReactorKit.View {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.textLabel!.text = nil
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func bind(reactor: CaseItem) {
        super.bind(item: reactor)
        reactor.state.map { $0.name }
            .bind(to: self.textLabel!.rx.text)
            .disposed(by: self.disposeBag)
        reactor.state.map { _ in }
            .bind(to: self.rx.setNeedsLayout)
            .disposed(by: self.disposeBag)
    }
}
