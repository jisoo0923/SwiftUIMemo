//
//  MemoCell.swift
//  SwiftUIMemo
//
//  Created by 박지수 on 2022/05/25.
//

import SwiftUI

struct MemoCell: View {
    @ObservedObject var memo: Memo  // memo가 update되는 시점마다 view가 update됨
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(memo.content)
                .font(.body)
                .lineLimit(1)       // memo 내용을 1줄만 보여줌(길면 뒷부분은 생략)
            
            Text(memo.insertDate, style: .date)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

struct MemoCell_Previews: PreviewProvider {
    static var previews: some View {
        MemoCell(memo: Memo(content: "Test"))
    }
}
