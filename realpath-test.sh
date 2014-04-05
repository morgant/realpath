#!/usr/bin/env roundup

describe "realpath"

before() {
	touch tmp
}

after() {
	rm tmp
}

it_displays_usage() {
	out="$(./realpath -h | head -n 1)"
	test "$out" = "Usage: realpath [options] path [...]"
}

it_converts_absolute_paths_without_change() {
	rel_path="/usr/local/bin"
	out_path="$(./realpath "$rel_path")"
	
	test "$out_path" = "$rel_path"
}

it_converts_root_path_without_change() {
	rel_path="/"
	out_path="$(./realpath "$rel_path")"
	
	test "$out_path" = "$rel_path"
}

it_converts_dotted_relative_paths() {
	cwd="$(pwd)"
	cur_dir="$(basename "$cwd")"
	
	rel_path="../${cur_dir}/"
	abs_path="$cwd"
	out_path="$(./realpath "$rel_path")"
	
	test "$out_path" = "$abs_path"
}

it_converts_dot_path_to_cwd() {
	rel_path="."
	abs_path="$(pwd)"
	out_path="$(./realpath "$rel_path")"
	
	test "$out_path" = "$abs_path"
}

it_converts_local_paths() {
	cwd="$(pwd)"
	
	rel_path="README.md"
	abs_path="${cwd}/README.md"
	out_path="$(./realpath "$rel_path")"
	
	test "$out_path" = "$abs_path"
}

it_converts_local_paths_which_exist_in_root_path() {
	cwd="$(pwd)"
	
	rel_path="tmp"
	abs_path="${cwd}/${rel_path}"
	out_path="$(./realpath "$rel_path")"
	
	test "$out_path" = "$abs_path"
}

it_fails_for_nonexistent_paths() {
	rel_path="/usr/local/mojo-jojo/but_first--i_must_attend_to_the_dishes_that_i_have_soiled_with_the_food_that_i_have_eaten"
	out=$(set +e ; ./realpath "$rel_path" >/dev/null ; echo $?)
	
	test $out -gt 0
}

it_fails_for_relative_home_paths() {
	user="$(whoami)"
	
	rel_path="~/Desktop/"
	abs_path="/Users/${user}/Desktop/"
	out=$(set +e ; ./realpath "$rel_path" >/dev/null ; echo $?)
	
	test $out -gt 0
}