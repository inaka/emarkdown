-module(emarkdown).
-author("Felipe Ripoll <felipe@inakanetworks.com>").
-export([to_html/1, to_html/2, init/0]).
-on_load(init/0).

-define(APPNAME, emarkdown).
-define(LIBNAME, emarkdown).

-spec to_html(binary()) -> binary().
to_html(Markdown) ->
  to_html(Markdown, []).

-spec to_html(binary(), []) -> binary().
to_html(_, _) ->
  erlang:nif_error(not_loaded).

init() ->
  SoName = case code:priv_dir(?APPNAME) of
    {error, bad_name} ->
      case filelib:is_dir(filename:join(["..", priv])) of
        true ->
          filename:join(["..", priv, ?LIBNAME]);
        _ ->
          filename:join([priv, ?LIBNAME])
      end;
    Dir ->
      filename:join(Dir, ?LIBNAME)
  end,
  erlang:load_nif(SoName, 0).
