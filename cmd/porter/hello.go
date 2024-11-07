package main

import (
	"get.porter.sh/porter/pkg/porter"
	"github.com/spf13/cobra"
)

func buildHelloCommand(p *porter.Porter) *cobra.Command {
	opts := porter.HelloOptions{}

	cmd := &cobra.Command{
		Use:   "hello",
		Short: "Say hello",
		PreRunE: func(cmd *cobra.Command, args []string) error {
			return opts.Validate()
		},
		RunE: func(cmd *cobra.Command, args []string) error {
			return p.Hello(opts)
		},
	}

	cmd.Flags().StringVarP(&opts.Name, "name", "n", "", "Your name")
	return cmd
}
