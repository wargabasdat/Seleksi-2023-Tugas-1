const FileSystem = require("fs");

/**
 * Write problems array into a file
 * @param {Array} problems
 */
async function writeToFile(toWrite, fileName) {
  FileSystem.writeFile(
    `../data/${fileName}.json`,
    JSON.stringify(toWrite),
    (error) => {
      if (error) throw error;
    }
  );
}

module.exports = writeToFile;
