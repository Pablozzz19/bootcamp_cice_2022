package com.cice.projectgallery

import android.Manifest
import android.app.Activity
import android.content.ContentValues
import android.content.Intent
import android.content.pm.PackageManager
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.net.Uri
import android.os.Build
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.Environment
import android.provider.MediaStore
import androidx.activity.result.contract.ActivityResultContracts
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.core.content.FileProvider
import com.cice.projectgallery.databinding.ActivityMainBinding
import java.io.File
import java.io.FileOutputStream
import java.io.IOException
import java.text.SimpleDateFormat
import java.util.*

class MainActivity : AppCompatActivity() {

    // region - Global Variables
    var listPhotosUri = ArrayList<Uri>()
    private lateinit var mPhotoPath : String
    private val directoryName = "myGallery"
    // endregion

    // region - Permission Variables
    val PERMISSION_REQUEST_CODE = 200
    // endregion

    // region - Binding
    private lateinit var binding: ActivityMainBinding
    // endregion

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.btnCamera.setOnClickListener {
            checkCameraPermission()
        }

    }

    // region - Private Methods

    // region - Permissions
    private fun checkCameraPermission() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            if (ContextCompat.checkSelfPermission(this, Manifest.permission.CAMERA) == PackageManager.PERMISSION_DENIED) {
                val permission = arrayOf(Manifest.permission.CAMERA)
                requestPermissions(permission, PERMISSION_REQUEST_CODE)
            } else {
                openCamera()
            }
        } else {
            openCamera()
        }
    }
    // endregion

    // region - Create File
    @Throws(IOException::class)
    private fun createFile() : File {

        val formatTime = SimpleDateFormat("yyyyMMdd_HHMMSS").format(Date())
        val storageDir = getExternalFilesDir(Environment.DIRECTORY_PICTURES)

        return File.createTempFile(
            "JPEG_${formatTime}_",
            ".jpg",
            storageDir
        ).apply {
            mPhotoPath = absolutePath
        }

    }
    // endregion

    // region - Open Camera
    private fun openCamera() {

        val takePictureIntent = Intent(MediaStore.ACTION_IMAGE_CAPTURE)
        val file = createFile()

        val uri = FileProvider.getUriForFile(
            this,
            "com.cice.projectgallery",
            file
        )

        takePictureIntent.putExtra(MediaStore.EXTRA_OUTPUT, uri)
        resultLauncherCamera.launch(takePictureIntent)

    }
    // endregion

    // region - Read Gallery
    private fun readGallery() {

        listPhotosUri.clear()

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {

            val projection = arrayOf(
                MediaStore.MediaColumns._ID,
                MediaStore.MediaColumns.RELATIVE_PATH,
                MediaStore.MediaColumns.DISPLAY_NAME,
            )
            val selection = "${MediaStore.MediaColumns.RELATIVE_PATH} LIKE ?"
            val selectionArgs = arrayOf("DCIM/$directoryName%")
            val sortOrder = "${MediaStore.MediaColumns.DATE_ADDED} DESC"

            this.contentResolver.query(
                MediaStore.Images.Media.EXTERNAL_CONTENT_URI,
                projection,
                selection,
                selectionArgs,
                sortOrder
            )?.use {

                val id = it.getColumnIndexOrThrow(MediaStore.MediaColumns._ID)

                while (it.moveToNext()) {
                    val photoUri = Uri.withAppendedPath(
                        MediaStore.Images.Media.EXTERNAL_CONTENT_URI,
                        it.getString(id)
                    )
                    listPhotosUri.add(photoUri)
                }
            }

        } else {

            val imageRoot = File(Environment.getExternalStoragePublicDirectory(
                Environment.DIRECTORY_PICTURES
            ), directoryName)

            if (imageRoot.exists()) {

                val allFiles = imageRoot.listFiles()

                if (allFiles != null && allFiles.isNotEmpty()) {
                    for (currentFile in allFiles) {
                        if (currentFile.name.endsWith(".jpeg") || currentFile.name.endsWith(".jpg")) {
                            listPhotosUri.add(Uri.fromFile(currentFile))
                        }
                    }
                }

            }

        }

    }
    // endregion

    // region - StartActivityFotResult() obsolete. Use registerForActivityResult
    var resultLauncherCamera = registerForActivityResult(
        ActivityResultContracts.StartActivityForResult()
    ) {
        if (it.resultCode == Activity.RESULT_OK) {
            var bitmap = BitmapFactory.decodeFile(mPhotoPath)

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {

                val contentValues = ContentValues().apply {
                    put(MediaStore.MediaColumns.DISPLAY_NAME, "jg_${System.currentTimeMillis()}")
                    put(MediaStore.MediaColumns.MIME_TYPE, "image/jpeg")
                    put(MediaStore.MediaColumns.RELATIVE_PATH, "DCIM/$directoryName")
                }

                val uri = this.contentResolver.insert(
                    MediaStore.Images.Media.EXTERNAL_CONTENT_URI,
                    contentValues
                )

                if (uri != null) {
                    this.contentResolver.openOutputStream(uri).use { outputStream ->
                        bitmap.compress(Bitmap.CompressFormat.JPEG, 100, outputStream)
                        outputStream?.flush()
                        outputStream?.close()

                        readGallery()

                    }
                }

            } else {

                val imageRoot = File(Environment.getExternalStoragePublicDirectory(
                    Environment.DIRECTORY_PICTURES
                ), directoryName)

                if (!imageRoot.exists()) {
                    imageRoot.mkdirs()
                }

                val image = File(imageRoot, "jg${System.currentTimeMillis()}.jpg")
                val fileOutputStream = FileOutputStream(image)
                bitmap.compress(Bitmap.CompressFormat.PNG, 100, fileOutputStream)
                fileOutputStream.flush()
                fileOutputStream.close()

                readGallery()

            }
        }
    }
    // endregion

    // endregion
}