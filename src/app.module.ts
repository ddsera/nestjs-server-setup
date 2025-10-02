import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { AppController } from './app.controller';

@Module({
  imports: [
    // Load environment variables from .env file
    ConfigModule.forRoot({
      isGlobal: true, // Make config available everywhere
    }),
  ],
  controllers: [AppController], // Register our controller
  providers: [], // We'll add services here if needed
})
export class AppModule {}
