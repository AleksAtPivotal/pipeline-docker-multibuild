package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", handle)
	http.ListenAndServe(":8080", nil)
}

func handle(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello World")
}