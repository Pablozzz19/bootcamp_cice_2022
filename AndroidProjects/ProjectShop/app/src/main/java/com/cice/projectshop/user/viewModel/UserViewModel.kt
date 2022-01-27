package com.cice.projectshop.user.viewModel

import android.content.Context
import androidx.lifecycle.ViewModel
import com.cice.projectshop.user.model.UserProvider

class UserViewModel : ViewModel() {

    fun writeNewUser(email: String, fullName: String, password: String, context: Context) {
        UserProvider.writeNewUserModel(email = email,
            fullName = fullName,
            password = password,
            context = context)

    }

}