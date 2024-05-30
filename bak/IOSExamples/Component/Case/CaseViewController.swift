//
//  CaseViewController.swift
//  IOSExamples
//
//  Created by liaoya on 2022/11/15.
//

import UIKit
import ReactorKit
import RxSwift
import RxCocoa
import RxDataSources
import ReusableKit_Hi
import URLNavigator
import HiIOS

class CaseViewController: TableViewController, ReactorKit.View {

    struct Reusable {
        static let caseCell = ReusableCell<CaseCell>()
    }

    lazy var dataSource: RxTableViewSectionedReloadDataSource<CaseSection> = {
        return .init(
            configureCell: { _, tableView, indexPath, sectionItem in
                switch sectionItem {
                case .case(let item):
                    let cell = tableView.dequeue(Reusable.caseCell, for: indexPath)
                    cell.bind(reactor: item)
                    return cell
                }
            }
        )
    }()
    
    required init(_ navigator: NavigatorProtocol, _ reactor: BaseViewReactor) {
        defer {
            self.reactor = reactor as? CaseViewReactor
        }
        super.init(navigator, reactor)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(Reusable.caseCell)
        self.tableView.rx.itemSelected.subscribe(onNext: { [weak self] indexPath in
            guard let `self` = self else { return }
            self.tableView.deselectRow(at: indexPath, animated: true)
            switch self.dataSource[indexPath] {
            case let .case(item):
                guard let `case` = item.model as? Case else { return }
                // swiftlint:disable:next force_cast
                let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
                let reactorName = namespace + "." + `case`.forward + "ViewReactor"
                let controllerName = namespace + "." + `case`.forward + "ViewController"
                if let reactorClass = NSClassFromString(reactorName) as? CaseViewReactor.Type,
                    let controllerClass = NSClassFromString(controllerName) as? CaseViewController.Type {
                    let title = `case`.name
                    var models = [Case].init()
                    if let json = FileManager.default.json(withFilename: `case`.forward + ".json") as? [[String: Any]] {
                        models = [Case].init(JSONArray: json)
                    }
                    let viewReactor = reactorClass.init(self.reactor!.provider, [
                        Parameter.title: title,
                        Parameter.models: models
                    ])
                    let viewController = controllerClass.init(self.navigator, viewReactor)
                    self.navigationController?.pushViewController(viewController)
                    return
                }
                if let controllerClass = NSClassFromString(controllerName) as? UIViewController.Type {
                    let title = `case`.name
                    let viewController = controllerClass.init()
                    viewController.title = title
                    self.navigationController?.pushViewController(viewController)
                    return
                }
                let selector = NSSelectorFromString(`case`.forward + ":")
                if self.responds(to: selector) {
                    self.perform(selector, with: `case`.parameters)
                }
            }
        }).disposed(by: self.disposeBag)
    }

    func bind(reactor: CaseViewReactor) {
        super.bind(reactor: reactor)
        // action
        self.rx.viewDidLoad.map { Reactor.Action.load }
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        self.rx.emptyDataSet.map { Reactor.Action.load }
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        // state
        reactor.state.map { $0.title }
            .bind(to: self.navigationBar.titleLabel.rx.text)
            .disposed(by: self.disposeBag)
        reactor.state.map { $0.sections }
            .bind(to: self.tableView.rx.items(dataSource: self.dataSource))
            .disposed(by: self.disposeBag)
    }
}

extension CaseViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch self.dataSource[indexPath] {
        case let .case(item):
            return Reusable.caseCell.class.height(item: item)
        }
    }
    
}
