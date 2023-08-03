importScripts('https://www.gstatic.com/firebasejs/8.4.1/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/8.4.1/firebase-messaging.js');

   /*Update with yours config*/
   const firebaseConfig = {
    apiKey: "AIzaSyAgs4HJI0wEjZ0KXrwEgX7hCLnkAMH-yjc",
    authDomain: "flutterdemo-f8a65.firebaseapp.com",
    databaseURL: "https://flutterdemo-f8a65-default-rtdb.firebaseio.com",
    projectId: "flutterdemo-f8a65",
    storageBucket: "flutterdemo-f8a65.appspot.com",
    messagingSenderId: "280530107675",
    appId: "1:280530107675:web:29b963310fadf4bf6ee7be",
    measurementId: "G-60G1RJNRB9"
  };
  firebase.initializeApp(firebaseConfig);
  const messaging = firebase.messaging();

  /*messaging.onMessage((payload) => {
  console.log('Message received. ', payload);*/
  messaging.onBackgroundMessage(function(payload) {
    console.log('Received background message ', payload);

    const notificationTitle = payload.notification.title;
    const notificationOptions = {
      body: payload.notification.body,
    };

    self.registration.showNotification(notificationTitle,
      notificationOptions);
  });