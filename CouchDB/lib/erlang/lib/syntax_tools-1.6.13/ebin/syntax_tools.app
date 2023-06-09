% This is an -*- erlang -*- file.

{application, syntax_tools,
 [{description, "Syntax tools"},
  {vsn, "1.6.13"},
  {modules, [epp_dodger,
	     erl_comment_scan,
	     erl_prettypr,
	     erl_recomment,
	     erl_syntax,
	     erl_syntax_lib,
	     erl_tidy,
	     igor,
	     prettypr]},
  {registered,[]},
  {applications, [stdlib]},
  {env, []}]}.
