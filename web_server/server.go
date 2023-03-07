package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func main() {
	router := gin.Default()
	router.LoadHTMLGlob("./*html")

	router.GET("/", func(c *gin.Context) {
		c.HTML(http.StatusOK, "Login.html", nil)
	})


	err := router.Run(":8080")
	if err != nil {
		panic(err)
	}
}
