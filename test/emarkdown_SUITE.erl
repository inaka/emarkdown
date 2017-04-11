-module(emarkdown_SUITE).
-author("Felipe Ripoll <felipe@inakanetworks.com>").

-export([ all/0
        ]).

-export([ basic/1
        ]).

-type config() :: [{atom(), term()}].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Common test
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-spec all() -> [atom()].
all() ->  [basic].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Test Cases
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-spec basic(config()) -> no_return().
basic(_Config) ->
  <<"<p>hi all!</p>\n">> = emarkdown:to_html(<<"hi all!">>),
  <<"<p>it&#39;s me</p>\n">> = emarkdown:to_html(<<"it's me">>),
  <<"<p><em>this is a bold</em></p>\n">> = emarkdown:to_html(<<"*this is a bold*">>),
  <<"<h1>this is a header</h1>\n">> = emarkdown:to_html(<<"# this is a header">>),
  <<"<h2>this is a level 2 header</h2>\n">> = emarkdown:to_html(<<"## this is a level 2 header">>),
  ok.
