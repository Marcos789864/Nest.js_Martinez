import {
  Body,
  Controller,
  Post,
  Get,
  Patch,
  Param,
  ParseIntPipe,
} from '@nestjs/common';
import { JugadorDto } from './dto/JugadorDto';
import { JugadorService } from './Jugador.services';
import { updateJugadorDto } from './dto/updateJugador.dto';
@Controller('jugador')
export class JugadorController {
  constructor(private jugadorService: JugadorService) {}

  @Post()
  async create(@Body() createJugadorDto: JugadorDto) {
    return this.jugadorService.Create(createJugadorDto);
  }

  @Get()
  async findAll() {
    return this.jugadorService.GetJugadores();
  }

  @Patch(':id')
  async updateRango(
    @Param('id', ParseIntPipe) id: number,
    @Body() jugador: updateJugadorDto,
  ) {
    return this.jugadorService.UpdateJugador(id, jugador);
  }

  @Get(':id')
  async GetJugadorById(@Param('id', ParseIntPipe) id: number) {
    return this.jugadorService.GetJugadorById(id);
  }

  @Patch(':id/:puntos')
  async ActualizarPuntos(@Param('id', ParseIntPipe) id: number) {
    return this.jugadorService.ActualizarPuntos(id);
  }

  @Post(':Gmail/:Contraseña')
  async Login(
    @Param('Gmail') @Param('Contraseña') Gmail: string,
    Contraseña: string,
  ) {
    return this.jugadorService.Login(Gmail, Contraseña);
  }
}
