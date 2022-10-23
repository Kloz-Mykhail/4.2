import { MulterOptions } from '@nestjs/platform-express/multer/interfaces/multer-options.interface';
import { MAX_FILE_SIZE, TYPE_OF_FILES } from '../../app.constants';

export const multerOptions: MulterOptions = {
  limits: { fileSize: MAX_FILE_SIZE },

  fileFilter: function (req, file, cb) {
    if (!TYPE_OF_FILES.includes(file.mimetype)) {
      return cb(null, false);
    }
    cb(null, true);
  },
};
