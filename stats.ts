#!/usr/bin/env bun

interface Commit {
  hash: string;
  author: string;
  date: Date;
  message: string;
  files: string[];
}

// Check if in git repo
const checkGit = Bun.spawnSync(["git", "rev-parse", "--git-dir"]);
if (!checkGit.success) {
  console.error("Run this script in a git repo");
  process.exit(1);
}

// Get git log with files
const result = Bun.spawnSync(["git", "log", "--name-only"]);
const log = result.stdout.toString();

// Parse commits
const commits: Commit[] = log.split("\ncommit").map((c) => {
  const [hash, author, date, _1, message, _2, ...files] = c.trim().split("\n");

  return {
    hash: hash.trim(),
    author: author?.split("Author: ")[1]?.split("<")[0]?.trim() || "",
    date: new Date(date?.split("Date:")[1]?.trim() || ""),
    message: message?.trim() || "",
    files: files.filter((f) => f.trim() !== ""),
  };
});

// Count file changes
const files: Record<string, number> = {};

for (const c of commits) {
  for (const f of c.files) {
    if (!files[f]) {
      files[f] = 0;
    }
    files[f]++;
  }
}

// Show top 10 most changed files
const topFiles = Object.entries(files)
  .sort((a, b) => b[1] - a[1])
  .slice(0, 10);

console.log("\nTop 10 most changed files:");
console.log("===========================");
topFiles.forEach(([file, count]) => {
  console.log(`${count.toString().padStart(4)} - ${file}`);
});
