function obtenerParticipantes(){
    fetch("http://localhost:3000/users").then((res)=>{
        return res.json();
    }).then((res)=>{
        var doc = document.getElementById('personas');
        for (let index = 0; index < res.length; index++) {
            const element = res[index];
            var participante = document.createElement("li");   
            var node = document.createTextNode(element.nombres);
            participante.appendChild(node);
            doc.appendChild(participante);
        }
    })
}