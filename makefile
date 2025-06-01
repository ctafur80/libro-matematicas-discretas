


include toc.mk


OUTPUT_FILE_N := index




all : html docx help



help :
	@echo '																																									'
	@echo 'Las posibilidades son:																														'
	@echo '																																									'
	@echo '- html:   Crea el documento en formato web; HTML5 y CSS3.												'
	@echo '- docx:   Crea el documento en formato DOCX; como con Word de Microsoft.					'
	# @echo '- latex:  Crea el documento en formato LaTeX; sin compilar a PDF ni otro formato	'
	# @echo '- pdf:    Crea el documento en formato PDF; compilado como LaTeX.								'
	@echo '- all:    Crea los documentos para todos los formatos mencionados arriba.				'
	@echo '- clear:  Elimina todos los documentos de salida que se han creado. Se queda solo'
	@echo '            con el original y los accesorios, como metadatos.yaml, etc.									'
	@echo '																																									'



html: $(CONTENTS)
	pandoc $^ \
		--metadata-file metadatos.yaml \
		--citeproc \
		--defaults ./ajustes-pandoc/defaults-apuntes-asignaturas.yaml \
		--output $(OUTPUT_FILE_N).html ;



docx: $(CONTENTS)
	pandoc $^ \
		--metadata-file metadatos.yaml \
		--citeproc \
		--defaults ~/Documents/disenno-tipografia/ajustes-pandoc/defaults-libro-uned-web.yaml \
		--include-in-header ajustes-especificos/mathjax.html \
		--output $(OUTPUT_FILE_N).docx ;








# latex : $(FILE_FROM)
# 	$(eval OUTPUT_FILE := $(patsubst %.$(FORMAT_FROM_EXT),%.tex,$^))
# ifeq ("$(wildcard $(OUTPUT_FILE))", "")
# 	touch $(OUTPUT_FILE)
# endif
# 	pandoc $^ \
# 		--defaults $(PANDOC_DEFAULTS_DIR)/$(DOC_TYPE)/a-latex.yaml \
# 		--metadata-file metadatos.yaml \
# 		--citeproc \
# 		--output $(OUTPUT_FILE) ;
#
#
#
# pdf_first : $(FILE_FROM)
# 	$(eval OUTPUT_FILE := $(patsubst %.$(FORMAT_FROM_EXT),%.pdf,$^))
# ifeq ("$(wildcard $(OUTPUT_FILE))", "")
# 	touch $(OUTPUT_FILE)
# endif
# 	pandoc $^ \
# 		--defaults $(PANDOC_DEFAULTS_DIR)/$(DOC_TYPE)/a-pdf.yaml \
# 		--metadata-file metadatos.yaml \
# 		--citeproc \
# 		--output $(OUTPUT_FILE) ;
#
# refresh_pdf : $(PROJECT_NAME).pdf
# 	open -a Safari -g $^
#
# pdf : | pdf_first refresh_pdf



clear :



.PHONY : html docx clear help






