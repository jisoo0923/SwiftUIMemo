//
//  SwiftUIMemoApp.swift
//  Shared
//
//  Created by 박지수 on 2022/05/23.
//

import SwiftUI

@main
struct SwiftUIMemoApp: App {
    @StateObject var store = MemoStore()    // memo 저장소를 속성으로 먼저 저장
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(store)       // MainListView에 등록 -> MainListView에서 이어지는 View에서 동일한 객체 쉽게 사용가능
        }
    }
}
