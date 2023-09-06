//
//  TestSwiftUIView.swift
//  NearTruck
//
//  Created by 윤형찬 on 2023/09/06.
//

import SwiftUI

struct TruckMapViewController: View {
    @ObservedObject var viewModel: TruckMapViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.titleText)
            Button("Back") {
                viewModel.goBack()
            }
        }
    }
}

struct TestSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TruckMapViewController(viewModel: TruckMapViewModel())
    }
}
