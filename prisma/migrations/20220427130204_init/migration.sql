-- CreateTable
CREATE TABLE "bottom" (
    "id" TEXT NOT NULL,

    CONSTRAINT "bottom_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "middle" (
    "id" TEXT NOT NULL,
    "top_id" TEXT NOT NULL,
    "bottom_id" TEXT NOT NULL,

    CONSTRAINT "middle_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "top" (
    "id" TEXT NOT NULL,

    CONSTRAINT "top_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "middle" ADD CONSTRAINT "middle_bottom_id_fkey" FOREIGN KEY ("bottom_id") REFERENCES "bottom"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "middle" ADD CONSTRAINT "middle_top_id_fkey" FOREIGN KEY ("top_id") REFERENCES "top"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
