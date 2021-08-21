const { request } = require('express');
const { Pool } = require('pg');

const pool = new Pool({
    host: 'localhost',
    user : 'postgres',
    password: 'Admin',
    database: 'eventospoli',
    port: '5432'
});

//Funcion para obtener todos los usuarios
const getUsers = async (req, res)=> {
    const response = await pool.query('SELECT * FROM eventos.empleados');
    //console.log(response.rows);  //Para mostrar la info por consola
    //res.send('empleados');
    //Para no verlo por consola sino por navegador:
    res.status(200).json(response.rows);
}

//Funcion para obtener un usuario por su identificacion
const getUserById = async (req, res) => {
    const id = req.params.id;
    const response = await pool.query('SELECT * FROM eventos.empleados WHERE identificacion = $1',[id]);
    res.json(response.rows);
}

//funcion para crear usuarios
const createUser = async (req , res)=>{
    const { identificacion,nombres,apellidos,email,
        tipo_contratacion,tipo_empleado,cod_facultad
        ,codigo_sede,lugar_nacimiento} = req.body;

    const response = await pool.query('INSERT INTO eventos.empleados (identificacion,nombres,apellidos,email,tipo_contratacion,tipo_empleado,cod_facultad,codigo_sede,lugar_nacimiento) values ($1,$2,$3,$4,$5,$6,$7,$8,$9)',
    [identificacion,nombres,apellidos,email,tipo_contratacion,tipo_empleado,cod_facultad,codigo_sede,lugar_nacimiento]); 
    console.log(response);
    res.json({
        message: 'Empleado Agregado Satisfactoriamente',
        body:{
            user:{ identificacion,nombres,apellidos,email,
                tipo_contratacion,tipo_empleado,cod_facultad
                ,codigo_sede,lugar_nacimiento}
        }
    });
};

const updateUser = async (req, res) =>{
    const id = req.params.id;
    const {identificacion,nombres,apellidos,email,
        tipo_contratacion,tipo_empleado,cod_facultad
        ,codigo_sede,lugar_nacimiento} = req.body;

    /*console.log(identificacion,nombres,apellidos,email,
        tipo_contratacion,tipo_empleado,cod_facultad
        ,codigo_sede,lugar_nacimiento);
    */
   const response = await pool.query('UPDATE eventos.empleados SET nombres = $2,apellidos = $3,email = $4,tipo_contratacion = $5,tipo_empleado = $6,cod_facultad = $7,codigo_sede = $8,lugar_nacimiento = $9 WHERE identificacion = $1',
   [
        identificacion,
        nombres,
        apellidos,
        email,
        tipo_contratacion,
        tipo_empleado,
        cod_facultad,
        codigo_sede,
        lugar_nacimiento
   ])
   console.log(response);
   res.json('Usuario Actualizado Satisfactoriamente');
};

//Funcion para eliminar usuarios
const deleteUser = async (req, res) => {
    //res.send('USER DELETED: ' + req.params.id);
    const id = req.params.id;
    const response =  await pool.query('DELETE FROM eventos.empleados WHERE identificacion = $1',[id]);
    console.log(response);
    res.json(`User ${id} eliminado satisfactoriamente`);
};

module.exports = {
    getUsers,
    getUserById,
    createUser,
    deleteUser,
    updateUser
}