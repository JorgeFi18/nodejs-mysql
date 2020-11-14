const router = require('express').Router();

const studentController = require('../controllers/studentController');

router.get('/', studentController.list);
router.post('/add', studentController.save);
router.get('/update/:id', studentController.edit);
router.post('/update/:id', studentController.update);
router.get('/delete/:id', studentController.delete);
router.get('/add-student', studentController.addBook);

module.exports = router;