console.log('Clase Persona');
class Persona{
    constructor(documento,nombre){
        this._documento = documento;
        this._nombre = nombre;
    }

    get documento(){
        return this._documento;
    }

    set documento(documento){
        this._documento = documento;
    }

    get nombre(){
        return this._nombre;
    }

    set nombre(nombre){
        this._nombre = nombre;
    }

}