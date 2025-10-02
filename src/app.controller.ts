import { Controller, Get, Post, Body, Headers } from '@nestjs/common';

@Controller() // This makes this class a controller
export class AppController {
  // GET /api/test - Protected endpoint
  @Get('test')
  getTest() {
    return {
      message: 'GET test endpoint is working!',
      timestamp: new Date().toISOString(),
      method: 'GET',
    };
  }

  // POST /api/test - Protected endpoint that accepts data
  @Post('test')
  postTest(@Body() postData: any) {
    return {
      message: 'POST test endpoint is working!',
      timestamp: new Date().toISOString(),
      method: 'POST',
      received: postData, // Echo back the received data
    };
  }

  // GET /api/health - Public health check endpoint
  @Get('health')
  healthCheck() {
    return {
      status: 'ok',
      timestamp: new Date().toISOString(),
      service: 'Roqore Assessment API',
    };
  }
}
