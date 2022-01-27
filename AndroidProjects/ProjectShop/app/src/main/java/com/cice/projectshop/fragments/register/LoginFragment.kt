package com.cice.projectshop.fragments.register

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.viewModels
import com.cice.projectshop.MainActivity
import com.cice.projectshop.R
import com.cice.projectshop.databinding.FragmentLoginBinding
import com.cice.projectshop.databinding.FragmentRegisterBinding
import com.cice.projectshop.user.viewModel.UserViewModel

class LoginFragment : Fragment() {

    // region - Global Variables
    private var _binding: FragmentLoginBinding? = null
    private val binding get() = _binding!!
    private val userViewModel: UserViewModel by viewModels()
    // endregion

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        _binding = FragmentLoginBinding.inflate(inflater, container, false)

        navigateToRegisterFragment()
        setListener()

        return binding.root
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }

    // region - setListener()
    private fun setListener() {
        binding.btnSignIn.setOnClickListener {

            val email = binding.etEmail.text.toString()
            val password = binding.etPassword.text.toString()

            binding.btnSignIn.setOnClickListener {
                userViewModel.loginUser(email = email,
                    password = password,
                    context = context,
                    activity = activity)
            }

        }
    }
    // endregion

    // region - navigateToRegisterFragment()
    private fun navigateToRegisterFragment() {
        binding.tvSignUpHere.setOnClickListener {
            val mainActivity = activity as MainActivity
            mainActivity.setFragment(RegisterFragment())
        }
    }
    // endregion

}