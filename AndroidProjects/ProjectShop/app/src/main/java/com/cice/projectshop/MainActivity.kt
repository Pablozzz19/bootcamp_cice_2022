package com.cice.projectshop

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentTransaction
import androidx.fragment.app.commit
import com.cice.projectshop.databinding.ActivityMainBinding
import com.cice.projectshop.fragments.register.RegisterFragment

class MainActivity : AppCompatActivity() {

    private  lateinit var binding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        setFragment(RegisterFragment())

    }

    fun setFragment(fragment: Fragment) {
        supportFragmentManager.commit {
            replace(R.id.fcvContainerRegister, fragment, fragment.javaClass.toString())
            setReorderingAllowed(true)
            setTransition(FragmentTransaction.TRANSIT_FRAGMENT_OPEN)
            addToBackStack(null)
        }
    }
}