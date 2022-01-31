package com.cice.projectshop.clothes.viewModel

import androidx.lifecycle.ViewModel
import com.cice.projectshop.clothes.model.ClothesModel
import com.cice.projectshop.clothes.model.ClothesProvider

class ClothesViewModel : ViewModel() {

    fun readClothes() : ArrayList<ClothesModel> {
        return ClothesProvider.getAllClothes()
    }

}