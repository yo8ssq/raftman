package backend

import (
	"fmt"
	"net/url"

	"github.com/yo8ssq/raftman/spi"
)

func NewBackend(e spi.LogEngine, backendURL *url.URL) (spi.LogBackend, error) {
	switch backendURL.Scheme {
	case "sqlite":
		return newSQLiteBackend(backendURL)
	}
	return nil, fmt.Errorf("Invalid backend %s", backendURL.Scheme)
}
