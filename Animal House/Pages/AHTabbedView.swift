//
//  AHTabbedView.swift
//  Animal House
//
//  Created by Roy Geagea on 8/14/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct AHTabbedView: View {
    @State private var selection = 1
     
     var body: some View {
            TabView {
                NewsListPage(viewModel: NewsListViewViewModel())
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("News")
                }
                PetsToAdoptListPage(viewModel: PetsToAdoptListViewModel())
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Pets")
                }
                DoctorsListPage(viewModel: DoctorsListViewViewModel())
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Doctors")
                }
                if UserDefaultsManager.shared.isUserADoctor() {
                    DoctorProfilePage(viewModel: DoctorPageViewModel())
                    .tabItem {
                        Image(systemName: "4.square.fill")
                        Text("My Profile")
                    }
                }
                else {
                    ClientProfilePage(viewModel: ProfilePageViewModel())
                    .tabItem {
                        Image(systemName: "4.square.fill")
                        Text("My Profile")
                    }
                }
            }
            .edgesIgnoringSafeArea(.top)
     }
}

#if DEBUG
struct AHTabbedView_Previews: PreviewProvider {
    static var previews: some View {
        AHTabbedView()
    }
}
#endif
