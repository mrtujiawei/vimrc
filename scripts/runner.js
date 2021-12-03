/**
 * 运行需要编译代码
 * @filename: runner.js
 * @author: Mr Prince
 * @date: 2021-12-03 17:55:18
 */
const path = require('path');
const { exec } = require('child_process');

/**
 * @type {string}
 */
const filename = process.argv[2];

const runCommand = async (command) => {
  return new Promise((resolve) => {
    exec(command, (error, stdout, stderr) => {
      error ? resolve(stderr) : resolve(stdout);
    });
  });
};

const runTs = async (filename) => {
  console.log(
    await runCommand(`tsc ${filename}`)
  );

  const file = path.parse(filename);
  const jsFilename = path.join(
    file.dir,
    `${file.name}.js`
  );

  console.log(
    await runCommand(`node ${jsFilename}`)
  );

  console.log(
    await runCommand(`rm -rf ${jsFilename}`)
  );
};

console.clear();
if (filename.endsWith('.ts')) {
  console.log('compiling...');
  runTs(filename);
}
