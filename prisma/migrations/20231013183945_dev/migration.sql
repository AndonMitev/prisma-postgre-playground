/*
  Warnings:

  - You are about to drop the column `userId` on the `UserPreferences` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[userPreferencesId]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `userPreferencesId` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "UserPreferences" DROP CONSTRAINT "UserPreferences_userId_fkey";

-- DropIndex
DROP INDEX "UserPreferences_userId_key";

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "userPreferencesId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "UserPreferences" DROP COLUMN "userId";

-- CreateIndex
CREATE UNIQUE INDEX "User_userPreferencesId_key" ON "User"("userPreferencesId");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_userPreferencesId_fkey" FOREIGN KEY ("userPreferencesId") REFERENCES "UserPreferences"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
