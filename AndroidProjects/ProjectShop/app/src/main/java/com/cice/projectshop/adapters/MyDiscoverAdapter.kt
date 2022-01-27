package com.cice.projectshop.adapters

import android.content.Context
import android.graphics.BitmapFactory
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.cice.projectshop.R
import com.cice.projectshop.clothes.model.ClothesModel
import com.google.firebase.storage.FirebaseStorage
import com.google.firebase.storage.StorageReference
import java.io.File

class MyDiscoverAdapter(private val dataSet: List<ClothesModel>, private val context: Context?) :
    RecyclerView.Adapter<MyDiscoverAdapter.ViewHolder>() {

    private lateinit var storageReference : StorageReference

    inner class ViewHolder(view : View) : RecyclerView.ViewHolder(view) {

        val ivPhoto : ImageView
        val ivFav : ImageView
        val ivShop : ImageView
        val tvName : TextView
        val tvPrice : TextView

        init {

            ivPhoto = view.findViewById(R.id.ivPhoto)
            ivFav = view.findViewById(R.id.ivFav)
            ivShop = view.findViewById(R.id.ivShop)
            tvName = view.findViewById(R.id.tvName)
            tvPrice = view.findViewById(R.id.tvPrice)

        }

    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        // Create a new view, which defines the UI of the list item
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.clothes_row_item, parent, false)

        return ViewHolder(view)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        // Get element from your dataset at this position and replace the
        // contents of the view with that element
        storageReference = FirebaseStorage.getInstance().reference.child("Clothes/${dataSet[position].id}/shoe.PNG")
        val localFile = File.createTempFile("tempImage", "jpg")
        storageReference.getFile(localFile).addOnSuccessListener {

            val bitmap = BitmapFactory.decodeFile(localFile.absolutePath)
           holder.ivPhoto.setImageBitmap(bitmap)

        }
        holder.tvName.text = dataSet[position].name
        holder.tvPrice.text = "${dataSet[position].price}€"
    }

    // Return the size of your dataset (invoked by the layout manager)
    override fun getItemCount() = dataSet.size


}