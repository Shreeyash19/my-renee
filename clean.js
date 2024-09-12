const fs = require('fs');
const path = require('path');

const deleteFolderRecursive = function (folderPath) {
  if (fs.existsSync(folderPath)) {
    fs.readdirSync(folderPath).forEach((file, index) => {
      const curPath = path.join(folderPath, file);
      if (fs.lstatSync(curPath).isDirectory()) {
        deleteFolderRecursive(curPath);
      } else {
        fs.unlinkSync(curPath);
      }
    });
    fs.rmdirSync(folderPath);
  }
};

try {
  console.log('Cleaning node_modules...');
  deleteFolderRecursive(path.join(__dirname, 'node_modules'));
  console.log('Clean-up done.');
} catch (error) {
  console.error('Failed to clean up:', error);
  process.exit(1);
}