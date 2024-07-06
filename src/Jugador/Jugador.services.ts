import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { JugadorDto } from './dto/JugadorDto';
import { updateJugadorDto } from './dto/updateJugador.dto';
import { Jugador } from './Jugador.entity';
import { LoginJugadorDTO } from 'src/Auth/dto/loginJugadorDTO';
import { RegisterJugadorDTO } from 'src/Auth/dto/registerJugadorDTO';
import { createCipheriv, createDecipheriv, randomBytes, scrypt } from 'crypto';
import { promisify } from 'util';
import { jwtConstants } from 'src/Auth/entities/constant';

@Injectable()
export class JugadorService {
  constructor(
    @InjectRepository(Jugador) private jugadorRepository: Repository<Jugador>,
  ) {}

  Create(Jugador: JugadorDto) {
    const newJugador = this.jugadorRepository.create(Jugador);
    return this.jugadorRepository.save(newJugador);
  }

  GetJugadores() {
    return this.jugadorRepository.find();
  }

  UpdateJugador(id: number, jugador: updateJugadorDto) {
    this.jugadorRepository.update({ id }, jugador);
  }

  GetJugadorById(id: number) {
    this.jugadorRepository.findOne({
      where: {
        id: id,
      },
    });
  }

  async Login(info: LoginJugadorDTO) {
    try {
      const jugador = await this.jugadorRepository.findOne({
        where: {
          Gmail: info.Gmail,
        },
      });

      if (!jugador) {
        return 'El usuario con el Gmail no existe';
      }

      // Convertir el IV de hexadecimal a Buffer
      const ivBuffer = Buffer.from(jugador.iv, 'hex');

      // Crear el objeto decipher para descifrar usando AES-256-CTR
      const decipher = createDecipheriv('aes-256-ctr', jwtConstants.secret, ivBuffer);

      // Decifrar la contraseña y comparar
      let decryptedText = decipher.update(jugador.Contraseña, 'hex', 'utf8');
      decryptedText += decipher.final('utf8');

      if (info.Contraseña !== decryptedText) {
        return 'Contraseña incorrecta';
      } else {
        return 'Inicio de sesión exitoso';
      }
    } catch (error) {
      console.error('Error durante el inicio de sesión:', error);
      throw new Error('Error en el proceso de inicio de sesión');
    }
  }


  async Register(register: RegisterJugadorDTO) {
    
      // Generar un IV aleatorio
      try {
        console.log('Iniciando registro...');
  
        // Generar un IV aleatorio
        const iv = randomBytes(16);
        console.log('IV generado:', iv);
  
        // Generar una clave a partir de la contraseña
        const key = (await promisify(scrypt)(
          register.Contraseña,
          'salt',
          32,
        )) as Buffer;
        console.log('Clave generada a partir de la contraseña:', key);
  
        // Crear el cifrado usando aes-256-ctr y el IV generado
        const cipher = createCipheriv('aes-256-ctr', jwtConstants.secret, iv);
  
        // Cifrar la contraseña
        let encryptedText = Buffer.concat([
          cipher.update(register.Contraseña, 'utf8'),
          cipher.final(),
        ]);
        console.log('Contraseña cifrada:', encryptedText);
  
        // Convertir el IV a una cadena en formato hexadecimal
        const ivString = iv.toString('hex');
        console.log('IV en formato hexadecimal:', ivString);
  
        // Almacenar la contraseña cifrada y el IV en la base de datos
        register.Contraseña = encryptedText.toString('hex');
        register.iv = ivString;
  
        // Crear una nueva instancia de Jugador y guardarla en la base de datos
        const registerJugador = await this.jugadorRepository.create(register);
        await this.jugadorRepository.save(registerJugador);
        console.log('Registro completado:', registerJugador);
  
        return registerJugador;
      } catch (error) {
        console.error('Error durante el registro:', error);
        throw new Error('Error en el proceso de registro');
      }
    }
 }
