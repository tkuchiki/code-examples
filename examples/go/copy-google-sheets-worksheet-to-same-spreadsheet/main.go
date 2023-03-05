package main

import (
	"context"
	"log"
	"os"
	"strconv"
	"time"

	"google.golang.org/api/option"
	"google.golang.org/api/sheets/v4"
)

func newSheetsClient(ctx context.Context, credentials string) (*sheets.Service, error) {
	var svc *sheets.Service
	var err error
	if credentials == "" {
		// You may need to run the following commands beforehand:
		// gcloud auth application-default login --scopes "https://www.googleapis.com/auth/spreadsheets"
		svc, err = sheets.NewService(ctx)
	} else {
		svc, err = sheets.NewService(ctx, option.WithCredentialsFile(credentials), option.WithScopes(sheets.SpreadsheetsScope))
	}

	if err != nil {
		return nil, err
	}

	return svc, nil
}

func main() {
	ctx, cancel := context.WithTimeout(context.Background(), time.Minute)
	defer cancel()

	svc, err := newSheetsClient(ctx, "")
	if err != nil {
		log.Fatal(err)
	}

	spreadsheetID := os.Args[1]

	sourceSheetID, err := strconv.ParseInt(os.Args[2], 10, 64)
	if err != nil {
		log.Fatal(err)
	}

	newSheetName := os.Args[3]

	var insertSheetIndex int64 = 1

	req := sheets.Request{
		DuplicateSheet: &sheets.DuplicateSheetRequest{
			InsertSheetIndex: insertSheetIndex,
			NewSheetName:     newSheetName,
			SourceSheetId:    sourceSheetID,
		},
	}

	_, err = svc.Spreadsheets.BatchUpdate(spreadsheetID, &sheets.BatchUpdateSpreadsheetRequest{
		Requests: []*sheets.Request{&req},
	}).Do()

	if err != nil {
		log.Fatal(err)
	}
}
