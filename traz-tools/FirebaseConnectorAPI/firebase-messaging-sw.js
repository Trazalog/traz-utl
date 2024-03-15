// Note that you can only use Firebase Messaging here. Other Firebase libraries
 // are not available in the service worker.
 importScripts('https://www.gstatic.com/firebasejs/9.2.0/firebase-app-compat.js');
 importScripts('https://www.gstatic.com/firebasejs/9.2.0/firebase-messaging-compat.js');
//  importScripts('https://www.gstatic.com/firebasejs/9.2.0/firebase-init.js');
 // Initialize the Firebase app in the service worker by passing in
 // your app's Firebase config object.
 // https://firebase.google.com/docs/web/setup#config-object
 // Import and configure the Firebase SDK
// These scripts are made available when the app is served or deployed on Firebase Hosting
// If you do not serve/host your project using Firebase Hosting see https://firebase.google.com/docs/web/setup
// importScripts('/__/firebase/9.2.0/firebase-app-compat.js');
// importScripts('/__/firebase/9.2.0/firebase-messaging-compat.js');
// importScripts('/__/firebase/init.js');


/**
 * Here is is the code snippet to initialize Firebase Messaging in the Service
 * Worker when your app is not hosted on Firebase Hosting.
 // Give the service worker access to Firebase Messaging.
 // Note that you can only use Firebase Messaging here. Other Firebase libraries
 // are not available in the service worker.
 importScripts('https://www.gstatic.com/firebasejs/9.2.0/firebase-app-compat.js');
 importScripts('https://www.gstatic.com/firebasejs/9.2.0/firebase-messaging-compat.js');
 // Initialize the Firebase app in the service worker by passing in
 // your app's Firebase config object.
 // https://firebase.google.com/docs/web/setup#config-object
 */
 firebase.initializeApp({
    apiKey: "AIzaSyCa5APkAQ9JPYVcQhc98jxb3wCn1031pMw",
    authDomain: "traz-prod-assetplanner.firebaseapp.com",
    projectId: "traz-prod-assetplanner",
    storageBucket: "traz-prod-assetplanner.appspot.com",
    messagingSenderId: "691647622823",
    appId: "1:691647622823:web:236fe74b3c824c522e3582",
    measurementId: "G-SCQ1GVP44M"
});
 // Retrieve an instance of Firebase Messaging so that it can handle background
 // messages.
 const messagingSW = firebase.messaging();
// If you would like to customize notifications that are received in the
// background (Web app is closed or not in browser focus) then you should
// implement this optional method.
// Keep in mind that FCM will still show notification messages automatically 
// and you should use data messages for custom notifications.
// For more info see: 
// https://firebase.google.com/docs/cloud-messaging/concept-options
messagingSW.onBackgroundMessage(function(payload) {
    console.log('[firebase-messaging-sw.js] Received background message ', payload);
    // Customize notification here
    var notificationTitle = 'Proceso de tareas de mantenimiento.';
    var notificationOptions = {
        body: 'Se genero una nueva tarea de mantenimiento, por favor revise su bandeja.',
        icon: 'https://trazalog.com/wp-content/uploads/2024/01/cropped-kjgjufgdfsssssawse-300x300-1.png'
    };

    return self.registration.showNotification(notificationTitle,
        notificationOptions);
});
console.log(messagingSW);