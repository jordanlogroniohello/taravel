<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta http-equiv="X-UA-Compatible" content="ie=edge">
      <title>Bizmates | Exam : Taravel</title>
      <link href="{{ mix('css/app.css') }}" type="text/css" rel="stylesheet"/>
   </head>
   <body>
      
      <nav class="navbar navbar-light app-navbar">
         <a class="navbar-brand" href="{{ url('/home') }}">
               <img class="app-logo"  src="{{ url('images/taravellogo.png') }}" alt="tara-vel logo">
         </a>
         <span class="navbar-text">
               <a class="nav-item nav-link" href="{{ url('/destinations') }}">Search</a>
         </span>
      </nav>

     
      <div id="app">
         @yield('content')
      </div>

      <footer class="center ">
         Copyright © Tara-vel. All Rights Reserved.
      </footer>
      
      
     
     </body>
     <script src="{{ mix('js/app.js') }}" type="text/javascript"></script>
  </html>