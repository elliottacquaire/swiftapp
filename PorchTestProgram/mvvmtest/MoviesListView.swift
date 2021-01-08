//
//  MoviesListView.swift
//  PorchTestProgram
//
//  Created by Elliott on 2020/12/30.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import SwiftUI
import Combine

//struct MoviesListView: View {
    
//    @ObservedObject var viewModel : MoviesListViewModel
    
//    var body: some View {
//         NavigationView {
//                  content
//                      .navigationBarTitle("Trending Movies")
//              }
//              .onAppear {
////                self.viewModel.send(event: .onAppear)
//
//        }
//    }
    
//    private var content: some View {
//        switch MoviesListViewModel.$viewModel.State {
//           case .idle:
//               return Color.clear.eraseToAnyView()
//           case .loading:
//               return Spinner(isAnimating: true, style: .large).eraseToAnyView()
//           case .error(let error):
//               return Text(error.localizedDescription).eraseToAnyView()
//           case .loaded(let movies):
//               return list(of: movies).eraseToAnyView()
//           }
//       }
//}

//struct MoviesListView_Previews: PreviewProvider {
//    static var previews: some View {
//        MoviesListView()
//    }
//}

//struct MovieListItemView: View {
//    let movie: MoviesListViewModel.ListItem
//    @Environment(\.imageCache) var cache: ImageCache

//    var body: some View {
//        VStack {
//            title
////            poster
//        }
//    }
    
//    private var title: some View {
//        Text(movie.title)
//            .font(.title)
//            .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
//    }
    
//    private var poster: some View {
//        movie.poster.map { url in
//            AsyncImage(
//                url: url,
//                cache: cache,
//                placeholder: spinner,
//                configuration: { $0.resizable().renderingMode(.original) }
//            )
//        }
//        .aspectRatio(contentMode: .fit)
//        .frame(idealHeight: UIScreen.main.bounds.width / 2 * 3) // 2:3 aspect ratio
//    }
    
//    private var spinner: some View {
//        Spinner(isAnimating: true, style: .medium)
//    }
//}
