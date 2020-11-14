const router = require('express').Router();

const bookController = require('../controllers/bookController');

router.get('/', bookController.list);
router.post('/add', bookController.save);
router.get('/update/:id', bookController.edit);
router.post('/update/:id', bookController.update);
router.get('/delete/:id', bookController.delete);
router.get('/add-book', bookController.addBook);
router.get('/history/:id', bookController.history);
router.get('/history-add/:id', bookController.addHistory);
router.post('/history-add/:id', bookController.saveHistory);

module.exports = router;

