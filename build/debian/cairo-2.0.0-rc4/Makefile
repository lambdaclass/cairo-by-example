.PHONY: install uninstall

prefix = /usr

install:
	rustup override set stable
	cargo build --all --release --manifest-path ./Cargo.toml
	install -D ./target/release/cairo-compile $(DESTDIR)$(prefix)/bin/cairo-compile
	install -D ./target/release/cairo-format $(DESTDIR)$(prefix)/bin/cairo-format
	install -D ./target/release/cairo-language-server $(DESTDIR)$(prefix)/bin/cairo-language-server
	install -D ./target/release/cairo-run $(DESTDIR)$(prefix)/bin/cairo-run
	install -D ./target/release/cairo-test $(DESTDIR)$(prefix)/bin/cairo-test
	install -D ./target/release/sierra-compile $(DESTDIR)$(prefix)/bin/sierra-compile
	install -D ./target/release/starknet-compile $(DESTDIR)$(prefix)/bin/starknet-compile
	install -D ./target/release/starknet-sierra-compile $(DESTDIR)$(prefix)/bin/starknet-sierra-compile

uninstall:
	-rm -f $(DESTDIR)$(prefix)/bin/cairo-compile
	-rm -f $(DESTDIR)$(prefix)/bin/cairo-format
	-rm -f $(DESTDIR)$(prefix)/bin/cairo-language-server
	-rm -f $(DESTDIR)$(prefix)/bin/cairo-run
	-rm -f $(DESTDIR)$(prefix)/bin/cairo-test
	-rm -f $(DESTDIR)$(prefix)/bin/sierra-compile
	-rm -f $(DESTDIR)$(prefix)/bin/starknet-compile
	-rm -f $(DESTDIR)$(prefix)/bin/starknet-sierra-compile
