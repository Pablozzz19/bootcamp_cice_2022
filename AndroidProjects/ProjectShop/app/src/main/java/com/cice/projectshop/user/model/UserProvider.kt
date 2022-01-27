package com.cice.projectshop.user.model

import android.app.Activity
import android.content.Context
import android.net.Uri
import android.widget.Toast
import com.cice.projectshop.MainActivity
import com.cice.projectshop.R
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.database.ktx.database
import com.google.firebase.ktx.Firebase
import com.google.firebase.storage.FirebaseStorage
import com.google.firebase.storage.StorageReference

class UserProvider {

    companion object {

        // region - Global Variables
        private var mAuth: FirebaseAuth = FirebaseAuth.getInstance()
        private val database = Firebase.database("https://projectshop-38e0e-default-rtdb.europe-west1.firebasedatabase.app/")
        private val myRef = database.reference
        private lateinit var storageReference : StorageReference
        // endregion

        // region - Create UserModel - Not Finish
        fun writeNewUserModel(email: String, fullName: String, password: String, context: Context?, activity: Activity?) {
            if (email.isNotEmpty() && fullName.isNotEmpty() && password.isNotEmpty()) {
                mAuth.createUserWithEmailAndPassword(email, password).addOnCompleteListener {
                    if (it.isSuccessful) {

                        val id = mAuth.currentUser?.uid.toString()
                        writeUserInFirebaseDatabase(id = id,
                            email = email,
                            fullName = fullName,
                            activity = activity)
                        Toast.makeText(context, "Successful", Toast.LENGTH_LONG).show()
                    } else {
                        val sUser = "An error occurred while authenticating user."
                        Toast.makeText(context, sUser, Toast.LENGTH_LONG).show()
                    }
                }
            } else {
                Toast.makeText(context, "Fill in all the fields.", Toast.LENGTH_LONG).show()
            }

        }
        // endregion !!

        // region - Create User in Firebase Database
        private fun writeUserInFirebaseDatabase(id: String, email: String, fullName: String, activity: Activity?) {

            val userModel = UserModel(id = id,
                email = email,
                fullName = fullName,
                birthdate = "",
                description = "",
                gender = "")

            myRef.child("Users").child(id).setValue(userModel).addOnCompleteListener {
                if (it.isSuccessful) {
                    val imageUri: Uri = Uri.parse("android.resource://${activity?.packageName}/${R.drawable.default_image}")
                    storageReference = FirebaseStorage.getInstance()
                        .getReference("Users/" + mAuth.currentUser?.uid + "/profile.jpg")
                    storageReference.putFile(imageUri)
                }
            }

        }
        // endregion

        // region - Login User using FirebaseAuth
        fun loginUser(email: String, password: String, context: Context?, activity: Activity?) {

            if (email.isNotEmpty() && password.isNotEmpty()) {
                mAuth.signInWithEmailAndPassword(email, password).addOnCompleteListener {
                    if (it.isSuccessful) {
                        val mainActivity = activity as MainActivity
                        mainActivity.showHome(mAuth.currentUser?.uid.toString())
                        Toast.makeText(context, "Successful", Toast.LENGTH_LONG).show()
                    } else {
                        val sError = "An error occurred while logging user."
                        Toast.makeText(context, sError, Toast.LENGTH_LONG).show()
                    }
                }
            } else {
                Toast.makeText(context, "Fill in all the fields.", Toast.LENGTH_LONG).show()
            }

        }
        // endregion

    }

}