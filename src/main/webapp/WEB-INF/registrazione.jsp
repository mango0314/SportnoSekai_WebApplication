<%@page import="it.unirc.txw.progetto.beans.torneo.Torneo"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Registrazione - Sports no Sekai</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="180x180"
	href="../assets/ico/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="../assets/ico/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="../assets/ico/favicon-16x16.png">
<link rel="manifest" href="../assets/ico/site.webmanifest">

  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">

  <link rel="stylesheet" href="fonts/icomoon/style.css">

  <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
  <link rel="stylesheet" href="css/jquery-ui.css">
  <link rel="stylesheet" href="css/owl.carousel.min.css">
  <link rel="stylesheet" href="css/owl.theme.default.min.css">
  <link rel="stylesheet" href="css/owl.theme.default.min.css">

  <link rel="stylesheet" href="css/jquery.fancybox.min.css">

  <link rel="stylesheet" href="css/bootstrap-datepicker.css">

  <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

  <link rel="stylesheet" href="css/aos.css">

  <link rel="stylesheet" href="css/style.css">



</head>

<body>

	<% Vector<Torneo> lista_tornei = (Vector<Torneo>) request.getAttribute("lista tornei"); %>
		<% Vector<String> lista_errori = (Vector<String>) request.getAttribute("errori"); %>
	
	
	<% if (lista_errori != null && !lista_errori.isEmpty()) { %>
    <div class="alert alert-danger">
        <ul>
            <% 
               // Iterazione “alla vecchia scuola”
               for (int i = 0; i < lista_errori.size(); i++) { 
                   String messaggio = lista_errori.get(i);
            %>
                   <li><%= messaggio %></li>
            <% } %>
        </ul>
    </div>
<% } %>
	
  <!-- Navigation-->
    <!-- frame_logo.html -->
<div class="logo-header text-center py-4">
  <a href="/">
    <img src="images/Sports no Sekai logo no sfondo.png" alt="Sports no Sekai" class="logo img-fluid" />
  </a>
</div>
    

<section class="login-hero d-flex align-items-center justify-content-center">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-7">

        <h1 class="text-center mb-4 text-white">Registrati</h1>
        
        
		<h5 class="text-left mb-4 text-white">Dati di accesso</h5>
        <form id="contactForm" method="post" action="Registrazione">
          <div class="form-floating mb-3">
            <input class="form-control" id="username" name="username" type="text"
                   placeholder="Username" data-sb-validations="required" required/>
            <div class="invalid-feedback" data-sb-feedback="name:required">
              Username is required.
            </div>
          </div>
          <div class="form-floating mb-3">
				  <input 
				    class="form-control" 
				    id="password" 
				    name="password" 
				    type="password"
				    placeholder="Password"
				    required 
				    minlength="8"
				    pattern="^(?=.*[!@#$%^&*]).{8,}$"
				    title="Minimo 8 caratteri e almeno un carattere speciale (!@#$%^&*)" /> 
				  
				  
				  <div class="invalid-feedback">
				    La password deve avere almeno 8 caratteri e contenere un carattere speciale (!@#$%^&*).
				  </div>
				</div>
               
           
            
          		<h5 class="text-left mb-4 text-white">Dati squadra</h5>
          
                <div class="form-floating mb-3">
            <input class="form-control" id="nome" name="nomesquadra" type="text"
                   placeholder="Nome squadra" data-sb-validations="required" required/>
            <div class="invalid-feedback" data-sb-feedback="name:required">
              Nome squadra is required.
            </div>
          </div>
          
          <div class="form-floating mb-3">
    <select
      class="custom-select"
      id="torneo"
      name="torneo"
      required
 
    >
      <option value="" disabled selected>Seleziona il torneo</option>

      <%
      String sport = null;

      for ( Torneo t : lista_tornei){
          if (t.getSport_id() == 1) {
                sport = "Calcio";
            } else if (t.getSport_id() == 2) {

                sport = "Basketball";

            } else {
                sport = "Pallavolo";
            }


          %>

      <option value= "<%= t.getId() %>"> <%= t.getNome()%> - <%= sport %></option>

      <% 

       } %>
    </select>

    
  </div>
  
  
  			<div class="row">
        <!-- Clicca qui le tue immagini -->
        <div class="col-6 col-md-4 col-lg-3 logo-option mb-3">
          <input type="radio" id="logo1" name="teamLogo" value="logo_1.png" required>
          <label for="logo1" class="card p-2 text-center">
            <img src="/images/logo_1.png" class="img-fluid" alt="Logo 1">
            <div class="mt-2">Logo 1</div>
          </label>
        </div>
        <div class="col-6 col-md-4 col-lg-3 logo-option mb-3">
          <input type="radio" id="logo2" name="teamLogo" value="logo_2.png" required>
          <label for="logo2" class="card p-2 text-center">
            <img src="/images/logo_2.png" class="img-fluid" alt="Logo 2">
            <div class="mt-2">Logo 2</div>
            </label>
            </div>
            <div class="col-6 col-md-4 col-lg-3 logo-option mb-3">
           <input type="radio" id="logo3" name="teamLogo" value="logo_3.png" required >
          <label for="logo3" class="card p-2 text-center">
            <img src="/images/logo_3.png" class="img-fluid" alt="Logo 3">
            <div class="mt-2">Logo 3</div>
          </label> 
          </div>
           <div class="col-6 col-md-4 col-lg-3 logo-option mb-3">        
           <input type="radio" id="logo4" name="teamLogo" value="logo_4.png" required>
          <label for="logo4" class="card p-2 text-center">
            <img src="/images/logo_4.png" class="img-fluid" alt="Logo 4">
            <div class="mt-2">Logo 4</div>
          </label>
        </div>
        <div class="col-6 col-md-4 col-lg-3 logo-option mb-3">        
           <input type="radio" id="logo5" name="teamLogo" value="logo_5.png" required>
          <label for="logo5" class="card p-2 text-center">
            <img src="/images/logo_5.png" class="img-fluid" alt="Logo 5">
            <div class="mt-2">Logo 5</div>
          </label>
        </div>
        <div class="col-6 col-md-4 col-lg-3 logo-option mb-3">        
           <input type="radio" id="logo6" name="teamLogo" value="logo_6.png" required>
          <label for="logo6" class="card p-2 text-center">
            <img src="/images/logo_6.png" class="img-fluid" alt="Logo 6">
            <div class="mt-2">Logo 6</div>
          </label>
        </div>
        <div class="col-6 col-md-4 col-lg-3 logo-option mb-3">        
           <input type="radio" id="logo7" name="teamLogo" value="logo_7.png" required>
          <label for="logo7" class="card p-2 text-center">
            <img src="/images/logo_7.png" class="img-fluid" alt="Logo 7">
            <div class="mt-2">Logo 7</div>
          </label>
        </div>
        <div class="col-6 col-md-4 col-lg-3 logo-option mb-3">        
           <input type="radio" id="logo8" name="teamLogo" value="logo_8.png" required>
          <label for="logo8" class="card p-2 text-center">
            <img src="/images/logo_8.png" class="img-fluid" alt="Logo 8">
            <div class="mt-2">Logo 8</div>
          </label>
        </div>
        
        <div class="invalid-feedback">
      Devi selezionare un logo.
    </div>
        <!-- Aggiungi altri logo-option come sopra -->
      </div>
      
      
      <div class="container py-4">
    <h5 class="mb-4"><strong>Componenti squadra</strong></h5>
    <table class="table table-striped table-bordered">
      <thead class="thead-dark">
        <tr>
          <th scope="col">#</th>
          <th scope="col">Nome</th>
          <th scope="col">Cognome</th>
          <th scope="col">Data di nascita</th>
          <th scope="col">Numero di maglia</th>
         
        </tr>
      </thead>
      <tbody>
      <% for (int i = 1; i <= 7; i++) { %>
            <tr>
              <th scope="row" class="text-white"><%= i %></th>
              <td>
                <input type="text" name="nome_<%= i %>"
                       class="form-control form-control-sm" 
                       pattern="[A-Za-zÀ-ÿ\s']+" 
       title="Il nome non può contenere numeri o simboli speciali"
                       required>
              </td>
              <td>
                <input type="text" name="cognome_<%= i %>"
                       class="form-control form-control-sm" 
                       pattern="[A-Za-zÀ-ÿ\s']+" 
       title="Il cognome non può contenere numeri o simboli speciali"
                       required>
              </td>
              <td>
                <input type="date" name="dataNascita_<%= i %>"
                       class="form-control form-control-sm data-nascita"
                       placeholder="gg/mm/aaaa"
						pattern="\d{2}/\d{2}/\d{4}"
                       title="Formato richiesto: gg/mm/aaaa"
                       required>
                         <!-- Contenitore per il messaggio dinamico -->
  						<div class="invalid-feedback age-feedback" style="display:none;">
   						 Età non valida: devi avere tra 18 e 60 anni.
  						</div>
              </td>
              <td>
                <select name="numeroMaglia_<%= i %>"
                        class="form-select form-select-sm jersey-select"
                        required>
                  <option value="" selected disabled>— Seleziona —</option>
                  <% for (int n = 1; n <= 99; n++) { %>
                    <option value="<%= n %>"><%= n %></option>
                  <% } %>
                </select>
         
              </td>
                   
            </tr>
          <% } %>
          
         </table>
                     <div class="invalid-feedback">
      Devi selezionare uno numero di maglia.
    </div>
         
         </div>
         
         
          
          
          
          
          
          
          <button class="btn btn-primary btn-xl w-100" id="submitButton" type="submit">
            Registrati
          </button>
          
           
        </form>
        
        <br>
         <br>
         <br>

      </div>
    </div>
  </div>
</section>





     <!-- Foot-->
        <%@ include file="foot.html" %>



  </div>
  <!-- .site-wrap -->

  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/jquery.countdown.min.js"></script>
  <script src="js/bootstrap-datepicker.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.fancybox.min.js"></script>
  <script src="js/jquery.sticky.js"></script>
  <script src="js/jquery.mb.YTPlayer.min.js"></script>
  <script>
  				function selezionaVoce(testo) {
   				 // Cambia il testo del bottone principale
    			document.getElementById("dropdownBtn").innerText = testo;

    				// (Facoltativo) Invia la scelta alla servlet
    				// fetch('MiaServlet', { ... })
  					}
			</script>
			
			
<script>
  // Seleziona tutti gli input con classe "data-nascita"
  document.querySelectorAll('.data-nascita').forEach(function(input) {
    // Ogni input avrà un elemento fratello (sibling) con classe "age-feedback"
    // dove andremo a visualizzare i messaggi di errore o di validazione
    const feedback = input.parentNode.querySelector('.age-feedback');

    // Quando l’utente digita all’interno dell’input (evento "input"), eseguiamo:
    input.addEventListener('input', function(e) {
      // 1) Rimuovi tutti i caratteri non numerici
      let digits = input.value.replace(/\D/g, '');
      // 2) Limita la lunghezza a 8 cifre (formato DDMMYYYY senza slash)
      if (digits.length > 8) {
        digits = digits.slice(0, 8);
      }
      // 3) Ricostruisci la stringa con gli slash ("/") al posto giusto
      let formatted = '';
      if (digits.length > 4) {
        // Se abbiamo più di 4 cifre -> formattiamo come "DD/MM/YYYY"
        formatted = digits.slice(0, 2) + '/' +
                    digits.slice(2, 4) + '/' +
                    digits.slice(4);
      } else if (digits.length > 2) {
        // Se abbiamo tra 3 e 4 cifre -> formattiamo come "DD/MM"
        formatted = digits.slice(0, 2) + '/' +
                    digits.slice(2);
      } else {
        // Altrimenti siamo ancora a "DD" (o meno di due cifre)
        formatted = digits;
      }
      // 4) Aggiorniamo il valore dell’input con la stringa formattata
      input.value = formatted;

      // 5) Resettiamo eventuali classi di validazione (in modo da ricalcolare da zero)
      feedback.style.display = 'none';
      input.classList.remove('is-invalid', 'is-valid');
    });

    // Quando l’utente preme un tasto mentre l’input è “pieno” (10 caratteri, includendo 2 slash),
    // blocchiamo qualsiasi tasto diverso da Backspace (8) o Delete (46)
    input.addEventListener('keydown', function(e) {
      const allowed = [8, 46]; // codici dei tasti Backspace e Delete
      if (input.value.length >= 10 && !allowed.includes(e.keyCode)) {
        // Se siamo già a 10 char e il tasto non è consentito -> preveniamo l’inserimento
        e.preventDefault();
      }
    });

    // Quando l’utente esce (evento "blur") dal campo, eseguiamo la validazione completa:
    input.addEventListener('blur', function() {
      const val = input.value.trim();        // Rimuove spazi vuoti a inizio/fine
      const parts = val.split('/');          // Suddivide su "/" -> [DD, MM, YYYY]
      let dob = null;                        // Se la data è valida, qui ci mettiamo il Date object

      // Controllo di validità basilare: deve esserci un array di 3 elementi
      if (parts.length === 3) {
        const d = parseInt(parts[0], 10),
              m = parseInt(parts[1], 10) - 1,  // JS conta i mesi da 0 a 11
              y = parseInt(parts[2], 10);
        const dt = new Date(y, m, d);
        // Verifichiamo che il Date risultante corrisponda davvero a d/m/y
        if (dt.getFullYear() === y && dt.getMonth() === m && dt.getDate() === d) {
          dob = dt; // La data è valida, possiamo usarla
        }
      }

      // Se non abbiamo ottenuto un Date valido (dob === null), mostriamo errore
      if (!dob) {
        feedback.textContent = 'Campo non valido';
        showError(); // Funzione interna mostra il messaggio
        return;
      }

      // Calcolo dell’età confrontando con la data odierna
      const today = new Date();
      let age = today.getFullYear() - dob.getFullYear();
      const mm = today.getMonth() - dob.getMonth();
      // Se siamo ancora “prima” del compleanno nell’anno in corso, sottrai 1
      if (mm < 0 || (mm === 0 && today.getDate() < dob.getDate())) age--;

      // Verifica range età: deve stare tra 18 e 60 anni
      if (age < 18 || age > 60) {
        feedback.textContent = 'Età non valida: hai ' + age + ' anni';
        showError();
      } else {
        // Età ok -> nascondi il messaggio di errore e aggiungi classe di “validità”
        feedback.style.display = 'none';
        input.classList.remove('is-invalid');
        input.classList.add('is-valid');
      }
    });

    // Funzione “privata” per mostrare l’errore: rende visibile l’elemento feedback
    // e aggiunge la classe CSS "is-invalid" sull’input per styling (es. bordo rosso).
    function showError() {
      feedback.style.display = 'block';
      input.classList.add('is-invalid');
    }
  });
</script>


			
			
			
			
			

<script>
  // Raccogliamo tutti i <select> con classe "jersey-select"
  const selects = Array.from(document.querySelectorAll('.jersey-select'));

  // Funzione che aggiorna le opzioni abilitate/disabilitate per ogni <select>
  function aggiornaOpzioni() {
    // 1) Creiamo un array "scelte" con i valori attualmente selezionati,
    //    escludendo le stringhe vuote (placeholder).
    const scelte = selects
      .map(sel => sel.value)
      .filter(v => v !== "");

    // 2) Per ciascun <select>...
    selects.forEach(sel => {
      const corrente = sel.value; // il valore “corrente” di questo select

      // Cicliamo tutte le <option> al suo interno
      sel.querySelectorAll('option').forEach(opt => {
        if (opt.value === "") {
          // L’opzione placeholder (valore vuoto) è sempre abilitata
          opt.disabled = false;
        } else if (opt.value === corrente) {
          // L’opzione già selezionata in questo select rimane abilitata qui,
          // altrimenti verrebbe disabilitata da “scelte.includes(opt.value)”.
          opt.disabled = false;
        } else if (scelte.includes(opt.value)) {
          // Se un altro select ha già scelto questo valore -> lo disabilitiamo
          opt.disabled = true;
        } else {
          // Altrimenti l’opzione è libera -> la lasciamo abilitata
          opt.disabled = false;
        }
      });
    });
  }

  // Associare l’evento “change” a ciascun select in modo che,
  // quando l’utente cambia un valore, ricalcoliamo il set di opzioni disponibili.
  selects.forEach(sel => {
    sel.addEventListener('change', aggiornaOpzioni);
  });

  // All’avvio della pagina, facciamo il primo “aggiornaOpzioni()” per definire lo stato iniziale
  aggiornaOpzioni();
</script>

  
 <script>
  // Quando il documento è pronto (evento "DOMContentLoaded"), eseguiamo questa callback
  document.addEventListener('DOMContentLoaded', () => {
    // Selezioniamo tutti gli input il cui name inizia con "nome_" o "cognome_"
    const inputs = document.querySelectorAll('input[name^="nome_"], input[name^="cognome_"]');
    inputs.forEach(input => {
      // Applichiamo l’evento "input" a ciascun campo per filtrare in tempo reale
      input.addEventListener('input', () => {
        // Sostituiamo ogni carattere che non sia:
        // - Lettere A-Z o a-z
        // - Caratteri accentati (À-ÿ)
        // - Spazi
        // - Apostrofo (')
        // con una stringa vuota: in pratica, li “censuriamo”.
        input.value = input.value.replace(/[^A-Za-zÀ-ÿ\s']/g, '');
      });
    });
  });
</script>



  <script src="js/main.js"></script>

</body>

</html>