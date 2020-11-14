const controller = {};

controller.list = (req, res) => {
  req.getConnection((err, conn) => {
    conn.query('SELECT * FROM alumnos', (err, students) => {
     if (err) {
      res.json(err);
     }
     res.render('students', {
        data: students
     });
    });
  });
};

controller.save = (req, res) => {
  const data = req.body;
  console.log(req.body)
  req.getConnection((err, connection) => {
    const query = connection.query('INSERT INTO alumnos set ?', data, (err, customer) => {
      console.log(customer)
      res.redirect('/students');
    })
  })
};

controller.edit = (req, res) => {
  const { id } = req.params;
  req.getConnection((err, conn) => {
    conn.query("SELECT * FROM alumnos WHERE carnet = ?", [id], (err, rows) => {
      res.render('students_edit', {
        data: rows[0]
      })
    });
  });
};

controller.update = (req, res) => {
  const { id } = req.params;
  const newBook = req.body;
  req.getConnection((err, conn) => {

  conn.query('UPDATE libros set ? where codigo_libro = ?', [newBook, id], (err, rows) => {
    res.redirect('/');
  });
  });
};

controller.delete = (req, res) => {
  const { id } = req.params;
  req.getConnection((err, connection) => {
    connection.query('DELETE FROM libros WHERE codigo_libro = ?', [id], (err, rows) => {
      res.redirect('/');
    });
  });
}

controller.addBook = (req, res) => {
  res.render('students_add');
}

module.exports = controller;
