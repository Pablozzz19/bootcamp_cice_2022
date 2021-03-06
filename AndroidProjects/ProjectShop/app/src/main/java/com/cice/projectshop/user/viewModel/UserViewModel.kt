package com.cice.projectshop.user.viewModel

import android.app.Activity
import android.content.Context
import androidx.lifecycle.ViewModel
import com.cice.projectshop.user.model.UserProvider

class UserViewModel : ViewModel() {

    fun writeNewUser(email: String, fullName: String, password: String, context: Context?, activity: Activity?) {
        UserProvider.writeNewUserModel(email = email,
            fullName = fullName,
            password = password,
            context = context,
            activity = activity)

    }

    fun loginUser(email: String, password: String, context: Context?, activity: Activity?) {
        UserProvider.loginUser(email = email,
            password = password,
            context = context,
            activity = activity)
    }

}