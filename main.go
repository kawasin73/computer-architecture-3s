package main

import (
	"os"
	"github.com/kawasin73/computer-architecture-3s/asm"
	"log"
	"bufio"
	"github.com/pkg/errors"
)

func main() {
	a := new(asm.Assembler)
	if len(os.Args) > 2 {
		input := os.Args[1]
		output := os.Args[2]
		if err := load(a, input); err != nil {
			log.Println(err)
			return
		}
		r, err := os.Open(input)
		if err != nil {
			log.Println("failed to open input file ", err)
			return
		}
		defer r.Close()
		w, err := os.Create(output)
		if err != nil {
			log.Println("failed to create output file ", err)
			return
		}
		defer w.Close()
		bw := bufio.NewWriter(w)
		if err = a.Assemble(r, bw); err != nil {
			log.Println("failed to assemble ", err)
		} else if err = bw.Flush(); err != nil {
			log.Println("failed to flush ", err)
		}
	} else {
		// TODO: from stdin
	}
}

func load(a *asm.Assembler, file string) error {
	f, err := os.Open(file)
	if err != nil {
		return errors.Wrap(err, "failed to open input file")
	}
	defer f.Close()

	if err = a.LoadLabels(f); err != nil {
		return errors.Wrap(err, "failed to load labels")
	}
	return nil
}
