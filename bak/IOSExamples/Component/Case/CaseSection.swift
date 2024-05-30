//
//  CaseSection.swift
//  IOSExamples
//
//  Created by liaoya on 2022/11/15.
//

import Foundation
import RxDataSources

enum CaseSection {
    case cases([CaseSectionItem])
}

extension CaseSection: SectionModelType {

    var items: [CaseSectionItem] {
        switch self {
        case let .cases(items): return items
        }
    }

    init(original: CaseSection, items: [CaseSectionItem]) {
        switch original {
        case .cases:
            self = .cases(items)
        }
    }
}

enum CaseSectionItem {
    case `case`(CaseItem)
}
