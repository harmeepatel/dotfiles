use std::collections::HashMap;
use std::io::{self, Write};
use std::process::Command;

fn main() -> io::Result<()> {
    let output = Command::new("git")
        .arg("status")
        .arg("-s")
        .output()
        .expect("Something went wrong executing `git status -s`");

    let mut status_map: HashMap<&str, u16> = HashMap::new();
    match std::str::from_utf8(&output.stdout) {
        Ok(val) => val
            .split('\n')
            .filter_map(|s| {
                if !s.is_empty() {
                    return Some(s.trim());
                }
                None
            })
            .for_each(|s| {
                let status = s.split_whitespace().next().unwrap_or("");
                *status_map.entry(status).or_insert(0) += 1;
            }),

        Err(e) => {
            println!("Something went wrong extracting `stdout` from output, with ERROR:");
            dbg!(e);
            std::process::exit(1);
        }
    };

    let mut status_map = status_map.into_iter().collect::<Vec<(&str, u16)>>();
    status_map.sort();

    let status_map = status_map
        .iter()
        .map(|(k, v)| format!("{v}{k}"))
        .collect::<Vec<String>>()
        .join(" ");

    match io::stdout().write_all(status_map.as_bytes()) {
        Ok(_) => Ok(()),
        Err(e) => {
            println!("Something went worng, pushing to stdout with err:\n{}", e);
            std::process::exit(1)
        }
    }
}
