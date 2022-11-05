//
//  DetailRow.swift
//  Country
//
//  Created by Marcelo de Araujo on 20.04.2022.
//

import SwiftUI

struct DetailRow: View {
    let leftLabel: Text
    let rightLabel: Text
    
    init(leftLabel: Text, rightLabel: Text) {
        self.leftLabel = leftLabel
        self.rightLabel = rightLabel
    }
    
    init(leftLabel: Text, rightLabel: LocalizedStringKey) {
        self.leftLabel = leftLabel
        self.rightLabel = Text(rightLabel)
    }
    
    var body: some View {
        HStack {
            leftLabel
                .font(.headline)
            Spacer()
            rightLabel
                .font(.callout)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 40, alignment: .leading)
    }
}

#if DEBUG
struct DetailRow_Previews: PreviewProvider {
    static var previews: some View {
        DetailRow(leftLabel: Text("Rate"), rightLabel: Text("$123.99"))
            .previewLayout(.fixed(width: 375, height: 40))
    }
}
#endif
