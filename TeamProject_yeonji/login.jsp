<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <title>StudentLogin</title>
</head>
<body>
    <form name="frmData" id="frmData" method="post" action="StudentMain.jsp">
        <input type="text" name="name" id="name" value="ȫ�浿" />
        <input type="text" name="id" id="id" value="gildong" />
    </form>
    
    <!-- <a href="#" onClick="openPop();">�˾�â���� POST ����!!</a> -->
    
    <div id="login-box">
      <div class="left">
        <h1 id='status'>Login</h1>
            <div style="padding:10px 0px 10px 0px">
                <input type="radio" name="check" value="�л�" onClick="location.href='StudentLogin.html'" /> �л�
                <input type="radio" name="check" value="������" onClick="location.href='ProfessorLogin.html'" /> ������
            </div>
            <form id="studentid" method="get" action="loginAction.jsp">
                <input type="text" id="email" onkeyup='checkAdmin()' name="email" placeholder="E-mail" />
                <input type="password" id="password" onkeyup='checkAdmin()' name="password" placeholder="Password" />
                <input type="submit" id='login' name="login" value="login" />
                <input type="submit" id='nextsignUP' name="nextsignUP" value="next signUP"/>
            </form>
            
           
           
        </div>
        <div class="right">
            <input type="button" id="forgotID" name="forgotID" value="forgotID" onClick="location.href='Forgot_id.html'" />
            <input type="button" id="forgotPassword" name="forgotPassword" value="forgotPassword" onClick="location.href='Forgot_password.html'" />
        </div>
      <!-- <div class="or">OR</div> -->
    </div>
    <script type="text/javascript">
        function checkAdmin(){
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;

            // document.getElementById("result").innerText = email;

            if(email === 'admin' && password === 'admin'){
                location.href='AdminPage.html'
            }
        }
    </script>
    <script type="module">
        // Import the functions you need from the SDKs you need
        import { initializeApp } from "https://www.gstatic.com/firebasejs/9.9.2/firebase-app.js";
        import { getDatabase, set, ref, update } from "https://www.gstatic.com/firebasejs/9.9.2/firebase-database.js";
        import { getAuth, createUserWithEmailAndPassword, signInWithEmailAndPassword, onAuthStateChanged, signOut } from "https://www.gstatic.com/firebasejs/9.9.2/firebase-auth.js"
        // TODO: Add SDKs for Firebase products that you want to use
        // https://firebase.google.com/docs/web/setup#available-libraries
      
        // Your web app's Firebase configuration
        const firebaseConfig = {
            apiKey: "AIzaSyAVjfBhilux_3BIyx486cRR2dsybsseKA8",
            authDomain: "team-a5651.firebaseapp.com",
            databaseURL: "https://team-a5651-default-rtdb.firebaseio.com",
            projectId: "team-a5651",
            storageBucket: "team-a5651.appspot.com",
            messagingSenderId: "804446190852",
            appId: "1:804446190852:web:66473b851c3cfc1792e451"
        };
                
        // Initialize Firebase
        const app = initializeApp(firebaseConfig);
        const database = getDatabase(app);
        const auth = getAuth();

        login.addEventListener('click',(e)=>{
            var email = document.getElementById('email').value;
            var password = document.getElementById('password').value;

            signInWithEmailAndPassword(auth, email, password)
            .then((userCredential) => {
            // Signed in 
            const user = userCredential.user;

            const dt = new Date();
            update(ref(database, 'users/' + user.uid),{
                last_login: dt,
            })

            alert('User loged in!');
            location.href='StudentMain.html'
            
            
            
            })
            .catch((error) => {
            const errorCode = error.code;
            const errorMessage = error.message;

            alert(errorMessage);
        });

        

        });
        

        const user = auth.currentUser;
        onAuthStateChanged(auth, (user) => {
        if (user) {
        // User is signed in, see docs for a list of available properties
        // https://firebase.google.com/docs/reference/js/firebase.User
        const uid = user.uid;
        //bla bla bla
        // ...
        } else {
        // User is signed out
        // ...
        //bla bla bla
        }
        });

        </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

    </body>

    
</html>