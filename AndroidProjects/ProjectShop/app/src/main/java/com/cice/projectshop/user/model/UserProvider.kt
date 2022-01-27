package com.cice.projectshop.user.model

import android.content.Context
import android.widget.Toast
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.database.ktx.database
import com.google.firebase.ktx.Firebase

class UserProvider {

    companion object {

        // region - Global Variables
        private lateinit var mAuth: FirebaseAuth //= FirebaseAuth.getInstance()
        private val database = Firebase.database("https://projectshop-38e0e-default-rtdb.europe-west1.firebasedatabase.app/")
        private val myRef = database.reference
        // endregion

        // region - Create UserModel
        fun writeNewUserModel(email: String, fullName: String, password: String, context: Context?) {
            if (email.isNotEmpty() && fullName.isNotEmpty() && password.isNotEmpty()) {
                mAuth.createUserWithEmailAndPassword(email, password).addOnCompleteListener {
                    Toast.makeText(context, "Successful", Toast.LENGTH_LONG).show()
                }
            } else {
                Toast.makeText(context, "Fill in all the fields.", Toast.LENGTH_LONG).show()
            }

        }
        // endregion

    }

}