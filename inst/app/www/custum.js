js <- Shiny.addCustomMessageHandler('change_skin', function(skin) {
        document.body.className = skin;
       });
  
  