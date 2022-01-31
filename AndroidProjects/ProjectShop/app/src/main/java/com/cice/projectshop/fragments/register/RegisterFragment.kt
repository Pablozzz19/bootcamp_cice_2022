package com.cice.projectshop.fragments.register

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import androidx.fragment.app.viewModels
import com.cice.projectshop.MainActivity
import com.cice.projectshop.databinding.FragmentRegisterBinding
import com.cice.projectshop.user.viewModel.UserViewModel

class RegisterFragment : Fragment() {

    // region - Global Variables
    private var _binding: FragmentRegisterBinding? = null
    private val binding get() = _binding!!
    private val userViewModel: UserViewModel by viewModels()
    // endregion

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        _binding = FragmentRegisterBinding.inflate(inflater, container, false)

        navigateToRegisterFragment()
        setListener()

        return binding.root
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }

    // region - navigateToRegisterFragment()
    private fun navigateToRegisterFragment() {
        binding.tvSignInHere.setOnClickListener {
            val mainActivity = activity as MainActivity
            mainActivity.setFragment(LoginFragment())
        }
    }
    // endregion

    // region - setListener()
    private fun setListener() {
        binding.btnSignUp.setOnClickListener {

            val email = binding.etCreateEmail.text.toString()
            val fullName = binding.etCreateFullName.text.toString()
            val password = binding.etCreatePassword.text.toString()

            userViewModel.writeNewUser(email = email,
                fullName = fullName,
                password = password,
                context = context,
                activity = activity)
        }
    }
    // endregion

}