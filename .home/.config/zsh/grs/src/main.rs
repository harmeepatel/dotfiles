use std::collections::BTreeMap;
use std::io::{self, Write};
use std::process::Command;

fn main() -> io::Result<()> {
    let output = Command::new("git")
        .arg("status")
        .arg("--porcelain")
        .output()
        .expect("Something went wrong executing `git status -s`");

    let mut opt_str = String::new();

    let val = std::str::from_utf8(&output.stdout).unwrap();
    let mut status_map: BTreeMap<&str, usize> = BTreeMap::new();
    for line in val.split("\n") {
        if line.is_empty() {
            continue;
        }
        let status = &line[0..2].trim();
        *status_map.entry(status).or_insert(0) += 1;
    }
    println!("{:?}", status_map);
    status_map
        .iter()
        .enumerate()
        .for_each(|(idx, (status, nums))| {
            opt_str.push_str(format!("{}{}", nums, status).as_str());
            if idx < status_map.len() - 1 {
                opt_str.push_str(" ");
            }
        });

    match io::stdout().write_all(opt_str.as_bytes()) {
        Ok(_) => return Ok(()),
        Err(e) => {
            println!("Something went worng, pushing to stdout with err:\n{}", e);
            return Ok(());
        }
    };
}
