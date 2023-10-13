import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();

async function main() {
  await prisma.user.deleteMany();

  const user = await prisma.user.create({
    data: {
      name: 'test',
      email: 'test@abv.bg',
      age: 15,
      wei: 10000000000000,
      user: {
        create: {
          emailUpdates: true
        }
      }
    },
    include: {
      user: true
    }
  });

  console.log('user: ', user);
}

main()
  .catch((e) => {
    console.error(e);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
