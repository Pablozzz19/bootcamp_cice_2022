package com.cice.projectshop

import android.content.Context
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import com.cice.projectshop.databinding.ActivityMainBinding
import com.cice.projectshop.databinding.ActivityNavigationBinding
import com.google.firebase.auth.FirebaseAuth

class NavigationActivity : AppCompatActivity() {

    private  lateinit var binding: ActivityNavigationBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityNavigationBinding.inflate(layoutInflater)
        setContentView(binding.root)

        getShared()
        borrar()

    }

    // region - getShared()
    private fun getShared() {

        val bundle = intent.extras
        val userId = bundle?.getString("userId")
        Log.e("UserId", userId.toString())
        val prefs = getSharedPreferences(getString(R.string.prefs_files), Context.MODE_PRIVATE).edit()
        prefs.putString("userId", userId)
        prefs.apply()

        binding.tvBorrar.text = userId.toString()

    }
    // endregion

    private fun borrar() {

        binding.btnBorrar.setOnClickListener {
            val prefs = getSharedPreferences(getString(R.string.prefs_files), Context.MODE_PRIVATE)?.edit()
            prefs?.clear()
            prefs?.apply()

            FirebaseAuth.getInstance().signOut()
            val intent = Intent (this, MainActivity::class.java)
            startActivity(intent)
        }
    }
}