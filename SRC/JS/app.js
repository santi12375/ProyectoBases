console.log('Listado de Personas');

const personas = [
    new Persona(1037671110,'Santiago'),
    new Persona(1037671111,'Daniel')
];

function mostrarPersonas(){
    console.log('Mostrar Personas...');
    let texto = '';
    for(let persona of personas){
        console.log(persona);
        texto += `<li>${persona.documento} ${persona.nombre}</li>`;
    }
    document.getElementById('personas').innerHTML = texto;
}

function agregarPersona(){
    const forma =  document.forms['forma'];
    const documento = forma['documento'];
    const nombre = forma['nombre'];
    if(documento.value != '' && nombre.value != ''){
        const persona = new Persona(documento.value, nombre.value);
        console.log(persona);
        personas.push(persona);
        mostrarPersonas();
    }else{
        console.log('No hay información que agregar')
    }
    
}