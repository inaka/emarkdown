CURDIR := $(shell pwd)
BASEDIR := $(abspath $(CURDIR)/..)

CFLAGS = -g -O3 -ansi -Wall -Wextra -Wno-unused-parameter

ERLANG_PATH = $(shell erl -eval 'io:format("~s", [lists:concat([code:root_dir(), "/erts-", erlang:system_info(version), "/include"])])' -s init stop -noshell)
CFLAGS += -I$(ERLANG_PATH)

HOEDOWN_PATH = $(REBAR_DEPS_DIR)/hoedown

CFLAGS += -I$(HOEDOWN_PATH)/src

ifneq ($(OS),Windows_NT)
	CFLAGS += -fPIC

	ifeq ($(shell uname),Darwin)
		LDFLAGS += -dynamiclib -undefined dynamic_lookup
	endif
endif

.PHONY: all emarkdown clean

all: emarkdown

emarkdown:
	if [ ! -d "$(HOEDOWN_PATH)" ]; then \
		curl -L https://github.com/hoedown/hoedown/archive/3.0.7.tar.gz | tar zx; \
		$(RM) -fr $(HOEDOWN_PATH); \
		mv hoedown-3.0.7 $(HOEDOWN_PATH); \
  fi

../priv/emarkdown.so: emarkdown emarkdown.c
	$(MAKE) -C $(HOEDOWN_PATH) libhoedown.a
	$(CC) $(CFLAGS) -shared $(LDFLAGS) -o $@ emarkdown.c $(HOEDOWN_PATH)/libhoedown.a

clean:
	$(RM) $(BASEDIR)/priv/emarkdown.so
	$(RM) -fr $(BASEDIR)/priv/emarkdown.so.dSYM
	$(MAKE) -C $(HOEDOWN_PATH) clean
