// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HolaMundo {

    //Variables de estado que almacen nuestro programa
    string public message;
    //Contador de cuantas vecces se a cambiado el mensaje
    uint256 public contador;
    //Dirección del dueño del contrato
    address public dueno;

    event sendMessage(string message);

    //Contructor - se ejecuta una sola vez al deployar
    constructor(){
        message = "Hola Blockchain! Mi primer contrato";
        contador = 0;
        dueno = msg.sender; //Quien deploya es el dueño
    }

    //Función para cambiar el mensaje (CUESTA GAS)
    function cambiarMensaje(string memory _newMessage) public {
        message = _newMessage;
        contador++; //Incrementamos el contador
        emit sendMessage("Se ha modificado el mensaje");
    }

    function getMessage() public view returns (string memory) {
        return string(abi.encodePacked(message, " - Solidity")); 
    }

    //Función para obtener el contador
    function obtenerContador() public view returns (uint256) {
        return contador;
    }

    //Función para obtener información del dueño
    function obtenerDueno() public view returns (address) {
        return dueno;
    }

}