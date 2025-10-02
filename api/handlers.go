package api

import (
	"os"
	"fmt"
	"gorm.io/gorm"
	"log"
	"gorm.io/driver/postgres"
	"github.com/joho/godotenv"
)

var DB *gorm.DB

func InitDB() {
	err := godotenv.Load()
	if err != nil {
		log.Fatalf("Failed to connect to the database: %v", err)
	}
	dsn := os.Getenv("DB_URL")
	DB, err = gorm.Open(postgres.Open(dsn), &gorm.Config{})
	if err != nil {
		log.Fatalf("Failed to connect to the database: %v", err)
	}
	sqlDB, err := DB.DB()
	if err != nil {
		log.Fatalf("Failed to connect to the database: %v", err)
	}
	if err := sqlDB.Ping(); err != nil {
		log.Fatalf("Failed to ping the DB: %v", err)
	}
	fmt.Println("Successfully connected to the db!!")
}


