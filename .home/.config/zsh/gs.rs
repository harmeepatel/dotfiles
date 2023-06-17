use std::collections::HashMap;
use std::io::{self, Write};
use std::process::Command;

fn main() -> io::Result<()> {
    let output = Command::new("git")
        .arg("status")
        .arg("-s")
        .output()
        .expect("Something went wrong executing `git status -s`");

    let git_status = match std::str::from_utf8(&output.stdout) {
        Ok(val) => val
            .split("\n")
            .filter_map(|s| {
                if !s.is_empty() {
                    return Some(s.trim());
                }
                None
            })
            .collect::<Vec<_>>(),
        Err(e) => {
            println!("Something went wrong extracting `stdout`, from output with ERROR:");
            dbg!(e);
            std::process::exit(1);
        }
    };

    let mut status_map: HashMap<&str, usize> = HashMap::new();
    git_status.iter().for_each(|s| {
        let status = s.split_whitespace().next().unwrap_or("");
        *status_map.entry(status).or_insert(0) += 1;
    });

    let mut status_map: Vec<_> = status_map.iter().collect();
    status_map.sort_by_key(|a| a.0);

    let mut x = 0;
    let mut output = String::new();
    status_map.iter().for_each(|(k, v)| {
        output.push_str(format!("{}{}", v, k).as_str());
        x += 1;
        if x < status_map.len() {
            output.push_str(" ");
        }
    });

    match io::stdout().write_all(output.as_bytes()) {
        Ok(_) => return Ok(()),
        Err(e) => {
            println!("Something went worng, pushing to stdout with err:\n{}", e);
            return Ok(());
        }
    };
}
