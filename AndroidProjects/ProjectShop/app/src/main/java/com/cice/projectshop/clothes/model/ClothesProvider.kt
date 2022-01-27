package com.cice.projectshop.clothes.model

import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.util.Log
import com.google.firebase.database.DataSnapshot
import com.google.firebase.database.DatabaseError
import com.google.firebase.database.ValueEventListener
import com.google.firebase.database.ktx.database
import com.google.firebase.ktx.Firebase
import com.google.firebase.storage.FirebaseStorage
import com.google.firebase.storage.StorageReference
import java.io.File

class ClothesProvider {

    companion object {

        // region - Global Variables
        private val database = Firebase.database("https://projectshop-38e0e-default-rtdb.europe-west1.firebasedatabase.app/")
        private val myRef = database.getReference("Clothes")
        private lateinit var storageReference : StorageReference
        private var clothesModelList: ArrayList<ClothesModel> = ArrayList()
        // endregion

        // region - Get all Clothes
        fun getAllClothes() : ArrayList<ClothesModel> {

            myRef.addValueEventListener(object: ValueEventListener {

                override fun onDataChange(snapshot: DataSnapshot) {
                    if(snapshot.exists()) {
                        for (clotheSnapshot in snapshot.children) {

                            val clothesModel = clotheSnapshot.getValue(ClothesModel::class.java)
                            clothesModelList.add(clothesModel!!)

                        }
                    }
                }

                override fun onCancelled(error: DatabaseError) {
                    TODO("Not yet implemented")
                }

            })

            return clothesModelList

        }
        // endregion

    }

}