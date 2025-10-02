package main

import (
	"log"
	"github.com/aryansharma2k4/AeroOps/api"
	"github.com/gin-gonic/gin"
)

func main(){
	api.InitDB()
	r := gin.Default()
	r.GET("/ping", func(c * gin.Context) {
		c.JSON(200, gin.H{"message": "pong"})
	})
	//defining all routes
	if err := r.Run(":8080"); err != nil {
		log.Fatal("Failed to start the server: ", err)
	}
}
