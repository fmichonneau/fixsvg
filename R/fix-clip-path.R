list_svg_files <- function(path) {
    list.files(path = path, pattern = "svg$", recursive = TRUE,
               ignore.case = TRUE, full.names = TRUE)
}

##' @importFrom xml2 read_xml xml_attrs xml_attr xml_ns
update_svg_files <- function(f) {
    xml_file <- xml2::read_xml(f)
    if ("clip-path" %in% names(xml2::xml_attrs(xml_file))) {
        xml2::xml_attr(xml_file, "clip-path", ns = xml2::xml_ns(xml_file)) <- NULL
        message("Updating ", f, " ... ", appendLF = FALSE)
        xml2::write_xml(xml_file, f)
        message(" DONE")
    }
}

##' Some version of Firefox don't display correctly SVG files that have a
##' `clip-path` element set. This function detects and removes this element from
##' any SVG files included within any subfolders given as a path.
##'
##' The diff between the files affected by this script and the original might be
##' significantly different, as the entire content of the file is parsed and
##' rewritten (using the `xml2` package). This has the side effect of
##' potentially affecting the order of the elements of the file leading to large
##' diffs.
##' @title Remove `clip-path` element from SVG files
##' @param path the path of a folder of a project that may contain SVG files.
##' @return A character vector of the absolute paths of the affected SVG files.
##' @importFrom purrr walk
##' @export
##' @md
fix_clip_path <- function(path) {
    list_svg <- list_svg_files(path)

    purrr::walk(list_svg, update_svg_files)

}
