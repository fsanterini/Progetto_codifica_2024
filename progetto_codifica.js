
/*per mettere in evidenza gli elementi codificati nel testo*/
$(document).ready(function() {
    // Attiva l'evidenziazione per persone reali
    $("#persone_reali").on("click", function() {
        $(".person").toggleClass("highlight_persone");
    });
    
    // Attiva l'evidenziazione per luoghi
    $("#luoghi").on("click", function() {
        $(".place").toggleClass("highlight_luoghi");
    });

    // Attiva l'evidenziazione per le citazioni
    $("#citazioni").on("click", function() {
        $(".cit").toggleClass("highlight_citazioni");
    });

    // Analogamente per date tipi
    $("#date").on("click", function() {
        $(".date").toggleClass("highlight_date");
    });

    // Evidenziazione per Bibliografia
    $("#bibliografia").on("click", function() {
        $(".bibliografia").toggleClass("highlight_bibliografia");
    });

    // Evidenziazione per epiteti
    $("#epiteti").on("click", function() {
        $(".epiteti").toggleClass("highlight_epiteti");
    });

    // Evidenziazione per organizzazioni
    $("#Organizzazioni").on("click", function() {
        $(".Org").toggleClass("highlight_Organizzazioni");
    });

    // Evidenziazione per errori
    $("#errori").on("click", function() {
        $(".errori").toggleClass("highlight_errori");
    });

    // Evidenziazione per correzioni
    $("#correzioni").on("click", function() {
        $(".correzioni").toggleClass("highlight_correzioni");
    });

    // Evidenziazione per abbreviazione
    $("#abbreviazioni").on("click", function() {
        $(".abbreviazioni").toggleClass("highlight_abbreviazioni");
    });

    // Evidenziazione per estensioni
    $("#estensioni").on("click", function() {
        $(".estensioni").toggleClass("highlight_estensioni");
    });

    // Evidenziazione per estensioni
    $("#foreign").on("click", function() {
        $(".foreign").toggleClass("highlight_foreign");
    });
});


/*per mostrare informazioni più approfondite*/

$(document).ready(function(){
    $(".person").click(function(event) {
        event.preventDefault(); 
        $(this).next(".info").toggle(); 
    });
});

$(document).ready(function(){
    $(".place").click(function(event) {
        event.preventDefault(); 
        $(this).next(".info").toggle(); 
    });
});

$(document).ready(function(){
    $(".Org").click(function(event) {
        event.preventDefault();
        $(this).next(".info").toggle(); 
    });
});

$(document).ready(function(){
    $(".bibliografia").click(function(event) {
        event.preventDefault(); 
        $(this).next(".info").toggle(); 
    });
});

/* per individuare le zone corrispondenti dall''immagine del testo al testo*/
$(document).ready(function() {

    $("area").on("click", function(e) {
        e.preventDefault();

        var targetId = $(this).attr("id");
        var targetspan = $("span#"+ targetId);

        if (targetspan.length == 1) {
            $('html, body').animate({
                scrollTop: targetspan.offset().top- 50
            }, 800);
        } else {
            console.error('Elemento di testo con ID ' + targetId + ' non trovato.');
        }
    });
});

$(document).ready(function() {
    // Funzione generale per evidenziare e contare elementi
    function handleButtonClick(buttonId, className, counterId) {
        $(buttonId).on("click", function() {
            $(className).toggleClass("highlight");
            
            // Conta gli elementi attivi
            let count = $(className).length
            $(counterId).text( count)
        });
    }

    // Configura i bottoni con la rispettiva classe CSS e ID del contatore
    handleButtonClick("#persone_reali", ".person", "#counter_persone");
    handleButtonClick("#luoghi", ".place", "#counter_luoghi");
    handleButtonClick("#citazioni", ".cit", "#counter_citazioni");
    handleButtonClick("#date", ".date", "#counter_date");
    handleButtonClick("#bibliografia", ".bibliografia", "#counter_bibliografia");
    handleButtonClick("#Organizzazioni", ".Org", "#counter_organizzazioni");
    handleButtonClick("#errori", ".errori", "#counter_errori");
    handleButtonClick("#correzioni", ".correzioni", "#counter_correzioni");
    handleButtonClick("#abbreviazioni", ".abbreviazioni", "#counter_abbreviazioni");
    handleButtonClick("#estensioni", ".estensioni", "#counter_estensioni");
    handleButtonClick("#foreign", ".foreign", "#counter_foreign");
});




