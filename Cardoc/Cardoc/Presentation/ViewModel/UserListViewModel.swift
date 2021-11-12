//
//  UserListViewModel.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/10.
//

import Foundation
import RxSwift
import RxCocoa
import NSObject_Rx

class UserListViewModel: NSObject {
    
    private let fetchUserListUseCase: FetchUserListUseCaseProtocol
    internal var userList = BehaviorRelay<[Item]>(value: [])
    internal let fetchMoreDatas = PublishSubject<String>()
    
    private var pageCounter = 1
    private var previousText = ""
    private var isPaginationRequestStillResume = false
    
    init(with fetchUserListUseCase: FetchUserListUseCaseProtocol) {
        self.fetchUserListUseCase = fetchUserListUseCase
        super.init()
        self.bind()
    }
    
    private func bind() {
        fetchMoreDatas.subscribe { [weak self] event in
            guard let self = self else {
                return
            }
            
            guard let element = event.element else {
                return
            }
            
            if self.previousText != element {
                self.previousText = element
                self.pageCounter = 1
                self.userList.accept([])
            }
            
            let query = ["q": element, "page" : self.pageCounter] as [String : Any]
            self.fetchData(with: query)
        }
        .disposed(by: rx.disposeBag)
    }
    
    private func fetchData(with query: [String: Any]? = nil) {
        if isPaginationRequestStillResume {
            return
        }
        
        isPaginationRequestStillResume = true
        
        self.excute(with: query).map{$0.items}.subscribe { items in
            let oldItems = self.userList.value
            self.userList.accept(oldItems + (items.element ?? []))
            self.isPaginationRequestStillResume = false
        }
        .disposed(by: self.rx.disposeBag)
        
        pageCounter += 1
    }
    
    func excute(with query: [String: Any]? = nil) -> Observable<UserList>{
        return fetchUserListUseCase.execute(with: query)
    }
}
