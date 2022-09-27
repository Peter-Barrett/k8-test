import { Injectable } from '@nestjs/common';

const numberForThisReplica = Math.random() * 100;

@Injectable()
export class AppService {
  getHello(): string {
    console.log(numberForThisReplica)
    return `Hello World! ${numberForThisReplica}`;
  }
}
