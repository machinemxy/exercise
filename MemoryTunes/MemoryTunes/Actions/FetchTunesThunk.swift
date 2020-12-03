//
//  FetchTunesThunk.swift
//  MemoryTunes
//
//  Created by Ma, Xueyuan | MTSD on 2020/12/03.
//  Copyright © 2020 raywenderlich. All rights reserved.
//

import ReSwift
import ReSwiftThunk

let fetchTunesThunk = Thunk<AppState> { (dispatch, getState) in
	dispatch(FetchTunesAction())
	
	if let state = getState() {
		iTunesAPI.searchFor(category: state.categoriesState.currentCategorySelected.rawValue) { imageUrls in
			dispatch(SetCardsAction(cardImageUrls: imageUrls))
		}
	}
}
