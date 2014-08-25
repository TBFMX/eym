    function mostrar(elem_id,botton) {
        var miDiv, mostrar;
        miDiv = document.getElementById(elem_id);
        if(miDiv.style.display == "none") {
            miDiv.style.display = "block";
            mostrar = document.getElementById(botton).childNodes[0];
            mostrar.data = printf("&#9650;");
        }
        else {
            miDiv.style.display = "none";
            mostrar = document.getElementById(botton).childNodes[0];
            mostrar.data = printf("&#9660;");
        }
    }