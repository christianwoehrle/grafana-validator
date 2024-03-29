package grafana_dtos_cw

import (
	"strings"
)

// taken from here: https://github.com/grafana/grafana/tree/master/pkg/api/dtos

type DataSourceID struct {
	Id int64 `json:"id"`
}

type DataSource struct {
	Id                int64           `json:"id"`
	OrgId             int64           `json:"orgId"`
	Name              string          `json:"name"`
	Type              string          `json:"type"`
	TypeLogoUrl       string          `json:"typeLogoUrl"`
	Url               string          `json:"url"`
	Password          string          `json:"password"`
	User              string          `json:"user"`
	Database          string          `json:"database"`
	BasicAuth         bool            `json:"basicAuth"`
	BasicAuthUser     string          `json:"basicAuthUser"`
	BasicAuthPassword string          `json:"basicAuthPassword"`
	WithCredentials   bool            `json:"withCredentials"`
	IsDefault         bool            `json:"isDefault"`
	SecureJsonFields  map[string]bool `json:"secureJsonFields"`
	Version           int             `json:"version"`
	ReadOnly          bool            `json:"readOnly"`
}

type DataSourceListItemDTO struct {
	Id          int64  `json:"id"`
	OrgId       int64  `json:"orgId"`
	Name        string `json:"name"`
	Type        string `json:"type"`
	TypeLogoUrl string `json:"typeLogoUrl"`
	Url         string `json:"url"`
	Password    string `json:"password"`
	User        string `json:"user"`
	Database    string `json:"database"`
	BasicAuth   bool   `json:"basicAuth"`
	IsDefault   bool   `json:"isDefault"`
	ReadOnly    bool   `json:"readOnly"`
}

type DataSourceList []DataSourceListItemDTO

func (slice DataSourceList) Len() int {
	return len(slice)
}

func (slice DataSourceList) Less(i, j int) bool {
	return strings.ToLower(slice[i].Name) < strings.ToLower(slice[j].Name)
}

func (slice DataSourceList) Swap(i, j int) {
	slice[i], slice[j] = slice[j], slice[i]
}
