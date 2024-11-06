package porter

import (
	"errors"
	"fmt"
)

type HelloOptions struct {
	Name string
}

func (o HelloOptions) Validate() error {
	if o.Name == "" {
		return errors.New("--name is required")
	}
	return nil
}

func (p *Porter) Hello(opts HelloOptions) error {
	fmt.Printf("Hello %s!\n", opts.Name)
	return nil
}
