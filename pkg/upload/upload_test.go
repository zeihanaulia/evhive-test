package upload

import (
	"testing"
)

var usecases = []struct {
	name string
	u    *upload
	want string
}{
// TODO: Add test cases.
}

func Test_upload_Images(t *testing.T) {
	for _, tt := range usecases {
		t.Run(tt.name, func(t *testing.T) {
			if got := tt.u.Images(); got != tt.want {
				t.Errorf("upload.Images() = %v, want %v", got, tt.want)
			}
		})
	}
}
