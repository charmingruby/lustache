-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_BarberAccount" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "userId" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "deletedAt" DATETIME,
    CONSTRAINT "BarberAccount_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_BarberAccount" ("createdAt", "id", "updatedAt", "userId") SELECT "createdAt", "id", "updatedAt", "userId" FROM "BarberAccount";
DROP TABLE "BarberAccount";
ALTER TABLE "new_BarberAccount" RENAME TO "BarberAccount";
CREATE UNIQUE INDEX "BarberAccount_userId_key" ON "BarberAccount"("userId");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
