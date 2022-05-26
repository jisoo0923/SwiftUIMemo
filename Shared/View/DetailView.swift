//
//  DetailView.swift
//  SwiftUIMemo
//
//  Created by 박지수 on 2022/05/26.
//

import SwiftUI

// 여기선 목록에서 선택한 메모를 받아야 함
struct DetailView: View {
    @ObservedObject var memo: Memo      // 메모를 저장하는 속성 추가
    
    @EnvironmentObject var store: MemoStore
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    HStack {
                        Text(memo.content)
                            .padding()
                        
                        Spacer(minLength: 0)
                    }
                    
                    Text(memo.insertDate, style: .date)
                        .padding()
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle("메모 보기")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(memo: Memo(content: "Hello"))
            .environmentObject(MemoStore())
    }
}
