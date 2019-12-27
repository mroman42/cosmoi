all: $(addprefix docs/, $(addsuffix .html, $(basename $(wildcard posts/*.org))))


%.html: %.org
	emacs $< --batch -u `id -un` --eval '(load user-init-file)' -f org-html-export-to-html

docs/posts/%.html: posts/%.html
	cp $< $@

.INTERMEDIATE: $(addsuffix .html, $(basename $(wildcard posts/*.org)))

clean:
	rm -rf *.blg *.log *.out _minted* *.bbl
