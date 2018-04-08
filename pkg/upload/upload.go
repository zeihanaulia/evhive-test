package upload

import (
	"crypto/rand"
	"fmt"
	"io/ioutil"
	"mime"
	"mime/multipart"
	"net/http"
	"os"
	"path/filepath"
)

// Upload interface
type Upload interface {
	Images(multipart.File, *multipart.FileHeader, error) string
}

type upload struct{}

// NewUpload initial to access this file
func NewUpload() Upload {
	return &upload{}
}

func (u *upload) Images(file multipart.File, handler *multipart.FileHeader, err error) string {

	fileBytes, err := ioutil.ReadAll(file)
	if err != nil {
		return "INVALID_FILE"
	}

	// check file type, detectcontenttype only needs the first 512 bytes
	filetype := http.DetectContentType(fileBytes)
	if filetype != "image/jpeg" && filetype != "image/jpg" &&
		filetype != "image/gif" && filetype != "image/png" &&
		filetype != "application/pdf" {
		return "INVALID_FILE_TYPE"
	}

	fileName := randToken(12)
	fileEndings, err := mime.ExtensionsByType(filetype)
	if err != nil {
		return "CANT_READ_FILE_TYPE"
	}

	if len(fileEndings) == 0 {
		return "EMPTY_FILE_ENDINGS"
	}

	fullFileName := fileName + fileEndings[0]
	newPath := filepath.Join("../../public/images/", fullFileName)
	fmt.Printf("FileType: %s, File: %s\n", filetype, newPath)

	// write file
	newFile, err := os.Create(newPath)
	if err != nil {
		return "CANT_WRITE_FILE"
	}
	defer newFile.Close()

	if _, err := newFile.Write(fileBytes); err != nil {
		return "CANT_WRITE_FILE"
	}

	return fullFileName
}

func randToken(len int) string {
	b := make([]byte, len)
	rand.Read(b)
	return fmt.Sprintf("%x", b)
}
