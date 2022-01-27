package com.cice.projectshop.fragments.register

import android.os.Bundle
import android.util.Log
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.viewModels
import androidx.recyclerview.widget.GridLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.cice.projectshop.R
import com.cice.projectshop.adapters.MyDiscoverAdapter
import com.cice.projectshop.clothes.model.ClothesModel
import com.cice.projectshop.clothes.model.ClothesProvider
import com.cice.projectshop.clothes.viewModel.ClothesViewModel
import com.cice.projectshop.databinding.FragmentDiscoverBinding
import com.cice.projectshop.databinding.FragmentRegisterBinding
import com.google.firebase.database.DataSnapshot
import com.google.firebase.database.DatabaseError
import com.google.firebase.database.ValueEventListener
import com.google.firebase.database.ktx.database
import com.google.firebase.ktx.Firebase

class DiscoverFragment : Fragment() {

    // region - Global Variables
    private var _binding: FragmentDiscoverBinding? = null
    private val binding get() = _binding!!
    private val clothesViewModel: ClothesViewModel by viewModels()
    // endregion

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        _binding = FragmentDiscoverBinding.inflate(inflater, container, false)

        return binding.root
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {

        fillAdapter()

        super.onViewCreated(view, savedInstanceState)
    }

    // region - fillAdapter
    private fun fillAdapter() {

        val myRecycler = binding.rvListDiscover
        val myList = MyDiscoverAdapter(clothesViewModel.readClothes(), context)
        myRecycler.adapter = myList
        myRecycler.layoutManager = GridLayoutManager(context, 2)

    }
    // endregion

}