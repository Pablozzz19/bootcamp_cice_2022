package com.cice.projectshop.user.model

data class UserModel(val id: String? = null, val email: String ?= null,
                     val fullName: String ?= null, val birthdate: String ?= null,
                     val description: String ?= null, val gender: String ?= null)
