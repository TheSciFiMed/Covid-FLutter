var prevScrollpos = window.pageYOffset;
window.onscroll = function() {
  var currentScrollPos = window.pageYOffset;
  if (prevScrollpos > currentScrollPos) {
    document.getElementById("navbar").style.top = "0";
  } else {
    document.getElementById("navbar").style.top = "-50px";
  }
  prevScrollpos = currentScrollPos;
};

window.alertNumber = 0; //make the number of alerts zero during first load

function openAlerts() {
  var modal = document.getElementById("myModal2");
  var span = document.getElementsByClassName("close")[1];
  modal.style.display = "block";
  span.onclick = function() {
    window.alertNumber = 0;
    document.getElementById("alertButton").classList.remove("badge1");
    modal.style.display = "none";
  };

  window.onclick = function(event) {
    if (event.target == modal) {
      window.alertNumber = 0;
      document.getElementById("alertButton").classList.remove("badge1");
      modal.style.display = "none";
    }
  };
  

  db.collection("admins")
    .doc("123456")
    .set({
      //id is set manually , in production request.auth.id should be used.
      lastTime: window.lastTime
    })
    .then(function() {
      console.log("Timestamp updated");
    })
    .catch(function(error) {
      console.error("Timestamp couldn't be updated ", error);
    });
}

function triggerMaps() {
  var modal = document.getElementById("myModal");

  var span = document.getElementsByClassName("close")[0];

  modal.style.display = "block";

  span.onclick = function() {
    modal.style.display = "none";
  };

  window.onclick = function(event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  };
}

var db = firebase.firestore();

function populateSearch(id) {
  if (id===":allusers"){
    window.location.assign('./extended.html');
  }
  let cityRef = db.collection("people").doc(id);
  let getDoc = cityRef
    .get()
    .then(doc => {
      if (!doc.exists) {
        console.log("No person with this id!");
        renderPeople("empty");
      } else {
        fillMapData(doc);
        renderPeople(doc);
      }
    })
    .catch(err => {
      console.log("Error getting document", err);
    });
}

function renderPeople(doc) {
  if (doc === "empty") {
    var parent = document.getElementById("search_result");
    parent.innerHTML = "";
  }
  var data = doc.data();
  console.log(data);
  var html = `
    
    <div class="card">
    <img src="${data.avatar}" alt="John" style="width:100%;border-radius:20px;">
    <h1>Person Name</h1>
    <p class="title">${
      data.quarantined === false ? "Not Quarantined" : "Quarantined"
    }</p>
    <p style="color:${data.infected === false ? "green" : "red"}; "> ${
    data.infected === false ? "Not infected" : "Infected"
  }</p>
    <p> ${data.lastLoc}</p>
    <div style="margin: 24px 0;">
      
    </div>
    <p><button id="myBtn" onclick="triggerMaps()">View this person</button></p>
    
  </div>`;
  console.log("about to insert");
  var parent = document.getElementById("search_result");
  parent.innerHTML = html;
}

function fillMapData(doc) { //should be optimised later
  window.trackingData = doc.data().trackingData;
  initMap();

  
}

function fetchAlerts(myTime) {
  var Name, Time, gender;

  var first = db
    .collection("violations")
    .orderBy("time", "desc")
    .endAt(myTime);

  return first.get().then(function(documentSnapshots) {
    if (documentSnapshots.empty) {
      //if no new alerts are available don't bother doing anything.
      return;
    }
    window.lastVisible = documentSnapshots.docs[0];
    var elem = document.getElementById("alerts");
    document.getElementById("alertButton").classList.add("badge1");
    document
      .getElementById("alertButton")
      .setAttribute(
        "data-badge",
        "" + (window.alertNumber + documentSnapshots.docs.length)
      );
    window.alertNumber= window.alertNumber  + documentSnapshots.docs.length; // if alerts are not seen they will add up.
    window.lastTime = new firebase.firestore.Timestamp(window.lastVisible.data().time.seconds+1,window.lastVisible.data().time.nanoseconds) // carefully incease the millisecond timestamp , so millisecond precision for alerts will be lost
    console.log(window.lastTime)
    documentSnapshots.forEach(element => {
      Name = element.data().name;
      Time = element.data().time;
      gender = element.data().gender;
      //console.log(element.data());

      var html = `<div >
  <img style="margin-top:20px;vertical-align: middle;
  width: 50px;
  height: 50px;
  border-radius: 50%;"src='${
    gender === "female"
      ? "https://www.w3schools.com/howto/img_avatar2.png"
      : "https://www.w3schools.com/howto/img_avatar.png"
  } ' alt="Avatar" class="avatar">
  <p><h5>${Name} </h5></p>
  <p>${element.data().userId}</p>
  </div>`;

      elem.innerHTML += html;
    });

    //set timeout and call itself to create a polling mechanism
    setTimeout(() => {
      fetchAlerts(window.lastTime);
    }, 100000);
  });
}

firebase.auth().onAuthStateChanged(function(user) {
  if (user) {
    let cityRef = db.collection("admins").doc("123456");
    let getDoc = cityRef
      .get()
      .then(doc => {
        if (!doc.exists) {
          console.log("No person with this id!");
        } else {
          fetchAlerts(doc.data().lastTime);
        }
      })
      .catch(err => {
        console.log("Error getting document", err);
        return; //in case of error don't dispaly any alerts;
      });

    document.getElementById("loader").style.display = "none";
    document.getElementById("body").style.display = "block";
    console.log("signed in");
  } else {
    window.location.assign("./login.html");
  }
});

