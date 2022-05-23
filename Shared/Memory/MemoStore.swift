//
//  MemoStore.swift
//  SwiftUIMemo
//
//  Created by 박지수 on 2022/05/23.
//

import Foundation
// memo 목록을 저장하는 클래스 구현
class MemoStore: ObservableObject {
    @Published var list: [Memo]     // 배열을 @Published 특성으로 선언하면 배열을 업데이트 할 때마다 binding되어있는 뷰도 자동으로 업데이트 됨
    
    init(){
        list = [
            Memo(content: "Hello", insertDate: Date.now),
            Memo(content: "Awesome", insertDate: Date.now.addingTimeInterval(3600 * -24)),
            Memo(content: "SwiftUI", insertDate: Date.now.addingTimeInterval(3600 * -48))
        ]
    }
    
    // 기본적인 CRUD 코드 구현
    func insert(memo: String){  // 입력한 memo를 parameter로 받음
        // list 배열에 저장
        list.insert(Memo(content: memo), at: 0)     // 새로운 memo는 항상 0번 index에 추가(가장 먼저 표시되겠지)
    }
    
    func update(memo: Memo?, content: String){  // parameter로 memo와 편집된 내용을 받음
        guard let memo = memo else {
            return
        }
        // content 속성에 바로 저장
        memo.content = content
    }
    
    func delete(memo: Memo){
        list.removeAll { $0.id == memo.id }     // memo 인스턴스가 저장되면 배열에서 바로 삭제
    }
    
    func delete(set: IndexSet){
        for index in set {
            list.remove(at: index)
            
        }
    }
}
