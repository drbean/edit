pandoc                                                   \
	-s -f markdown -t latex                          \
	--template=textbook                              \
	--variable=documentclass:memoir                  \
	--variable=papersize:b5paper                     \
	--variable=mainfont:"Linux Libertine O"          \
	--variable=CJKmainfont:"WenQuanYi Zen Hei"       \
	--variable=CJKmonofont='WenQuanYi Zen Hei Mono'  \
	--toc --natbib                                   \
	-o textbook.tex                                  \
	metadata.yaml                                    \
	--include-in-header=package.md                   \
	--include-before-body=cover_page.md              \
	--include-before-body=frontmatter.md             \
	preface.md                                       \
	toolbox.md                                       \
	whiteout.md                                      \
	plagiarism.md                                    \
	conversation.md                                  \
	mindmap.md                                       \
	notebook.md                                      \
	evaluation.md                                    \
	google.md                                        \
	metaphor.md                                      \
	thinking.md                                      \
	mainmatter.md                                    \
	story.md                                         \
	selfintro.md                                     \
	actionresearch.md                                \
	imrad.md                                         \
	survey.md                                        \
	over.md                                          \
	shopping.md                                      \
	adventure.md                                     \
	trip.md                                          \
	examples.md                                      \
	design.md                                        \
	critique.md                                      \
	exercise.md                                      \
	backmatter.md                                    \
	peer.md                                          \
	inclass.md                                       \
	adjectives.md                                    \
	awl.md                                           \
	bib.md                                           \
	authors.md
