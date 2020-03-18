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


function openAlerts(){
  var modal=document.getElementById('myModal2');
  var span = document.getElementsByClassName("close")[1];
  modal.style.display = "block";
  span.onclick = function() {
    document.getElementById('alertButton').classList.remove("badge1")
    modal.style.display = "none";
  };

  window.onclick = function(event) {
    if (event.target == modal) {
      document.getElementById('alertButton').classList.remove("badge1")
      modal.style.display = "none";
    }
  };
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

function fillMapData(doc) {
  window.trackingData = doc.data().trackingData;

  var sc = document.createElement("script");
  sc.setAttribute(
    "src",
    "https://maps.googleapis.com/maps/api/js?key=AIzaSyCBFrCkSgU3KmbU06ym27Eeqjlotb5sL9I&callback=initMap"
  );
  document.head.appendChild(sc);
}



function fetchAlerts(myTime){
  var Name,Time,gender;
  
  
  var first = db.collection("violations")
        .orderBy("time","desc").endAt(myTime);
        

return first.get().then(function (documentSnapshots) {
  // Get the last visible document
  window.lastVisible = documentSnapshots.docs[0];
  var elem=document.getElementById('alerts');
  document.getElementById('alertButton').setAttribute('data-badge',""+documentSnapshots.docs.length)
  window.lastTime=window.lastVisible.data().time;
  documentSnapshots.forEach(element => {
    
    Name=element.data().name;
    Time=element.data().time;
    gender=element.data().gender;
    //console.log(element.data());
    
    var html=`<div >
  <img style="margin-top:20px;vertical-align: middle;
  width: 50px;
  height: 50px;
  border-radius: 50%;"src='${gender==="female"? "https://www.w3schools.com/howto/img_avatar2.png":"https://www.w3schools.com/howto/img_avatar.png"} ' alt="Avatar" class="avatar">
  <p><h5>${Name} </h5></p>
  <p>${element.data().userId}</p>
  </div>`
    
    elem.innerHTML+= html

  });

  
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
        fetchAlerts(doc.data().lastTime)
      }
    })
    .catch(err => {
      console.log("Error getting document", err);
      fetchAlerts() //need to correct this method
    });
    
    document.getElementById("loader").style.display = "none";
    document.getElementById("body").style.display = "block";
    console.log("signed in");
  } else {
    window.location.assign("./login.html");
  }
});
