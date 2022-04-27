import { webcrypto as crypto } from "crypto";
import prisma from '@prisma/client'

declare module "crypto" {
  namespace webcrypto {
    function randomUUID(): string;
  }
}

const client = new prisma.PrismaClient()
try {
  await client.$transaction(async (prisma) => {
    await prisma.top.create({
      data: {
        middle: {
          create: [
            {
              bottom: {
                create: {
                  id: crypto.randomUUID(),
                },
              },
            }
          ]
        },
      }
    });
  });

} finally {
  await client.$disconnect();
}

