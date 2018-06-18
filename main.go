package main

import (
	"os"
	"github.com/kawasin73/computer-architecture-3s/asm"
	"log"
	"bufio"
	"github.com/pkg/errors"
	"io"
)

func main() {
	a := asm.NewAssembler()
	if len(os.Args) > 1 {
		inputs := os.Args[1:]
		for _, input := range inputs {
			if err := load(a, input); err != nil {
				log.Printf("failed to load (%v) %v\n", input, err)
				return
			}
		}
		bw := bufio.NewWriter(os.Stdout)
		for _, input := range inputs {
			if err := assemble(a, bw, input); err != nil {
				log.Printf("failed to assemble (%v) %v\n", input, err)
			}
		}
		if err := bw.Flush(); err != nil {
			log.Println("failed to flush ", err)
		}
	} else {
		// TODO: from stdin
	}
}

func load(a *asm.Assembler, file string) error {
	f, err := os.Open(file)
	if err != nil {
		return errors.Wrap(err, "open input file")
	}
	defer f.Close()

	if err = a.LoadLabels(f); err != nil {
		return errors.Wrap(err, "load labels")
	}
	return nil
}

func assemble(a *asm.Assembler, w io.Writer, file string) error  {
	f, err := os.Open(file)
	if err != nil {
		return errors.Wrap(err, "open input file")
	}
	defer f.Close()

	if err = a.Assemble(f, w); err != nil {
		return errors.Wrap(err, "assemble")
	}
	return nil
}
