import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Portfilo extends StatefulWidget {
  const Portfilo({Key? key}) : super(key: key);

  @override
  State<Portfilo> createState() => _PortfiloState();
}

class _PortfiloState extends State<Portfilo> {
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Center(
            child: Text(
              'My review',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 15,
              ),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              //_textController.dispose();
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Column(
          children: [
            Expanded(
                flex: 1,
                child: Center(
                  child: Container(
                    width: 130,
                    height: 130,
                    child: Stack(
                      children: [
                        ClipOval(
                          child: Image.network(
                            'http://via.placeholder.com/350x150',
                            height: 130,
                            width: 130,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: InkWell(
                              onTap: () {
                                print('ssssssssssssssssss');
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        title: const Text('Welcome'),
                                        content: const Text(
                                            'Do you want the picture from the camera or gallery?'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              Navigator.pop(context);
                                              image = await _picker.pickImage(
                                                  source: ImageSource.gallery);
                                              // Capture a photo
                                            },
                                            child: const Text('gallery'),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              Navigator.pop(context);
                                              image = await _picker.pickImage(
                                                  source: ImageSource.camera);
                                            },
                                            child: const Text('camera'),
                                          ),
                                        ],
                                      );
                                    });
                              },
                              child: CircleAvatar(
                                radius: 25.0,
                                backgroundColor: Theme.of(context).primaryColor,
                                child: Center(
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 30.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.person,
                            size: 20.0,
                            color: Colors.grey,
                          ),
                          title: Text(
                            'name',
                            style: TextStyle(
                                fontSize: 12.0, color: Colors.black45),
                          ),
                          subtitle: Text(
                            'Ammed Mohammed Ali',
                            style:
                                TextStyle(fontSize: 17.0, color: Colors.black),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                final _formKey = GlobalKey<FormState>();
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (builder) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Form(
                                                key: _formKey,
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                      labelText:
                                                          'enter your name'),
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Please enter your name';
                                                    } else if (value.length >
                                                        30) {
                                                      return 'your name is so long';
                                                    }
                                                  },
                                                  controller: _nameController,
                                                  keyboardType:
                                                      TextInputType.text,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 50.0,
                                              ),
                                              Row(
                                                children: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text('Cancel'),
                                                  ),
                                                  Spacer(),
                                                  TextButton(
                                                    onPressed: () async {
                                                      if (_formKey.currentState!
                                                          .validate()) {
                                                        /*update name on server and local provider */
                                                        Navigator.pop(context);
                                                      }

                                                      // Capture a photo
                                                    },
                                                    child: const Text('OK'),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              icon: Icon(
                                Icons.edit,
                                size: 20.0,
                                color: Colors.grey,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 50.0, left: 50.0),
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.phone,
                            size: 20.0,
                            color: Colors.grey,
                          ),
                          title: Text(
                            'phone',
                            style: TextStyle(
                                fontSize: 12.0, color: Colors.black45),
                          ),
                          subtitle: Text(
                            '01141366366',
                            style:
                                TextStyle(fontSize: 17.0, color: Colors.black),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                final _formKey = GlobalKey<FormState>();
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (builder) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            children: [
                                              Form(
                                                key: _formKey,
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                      labelText:
                                                          ' phone number'),
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Please enter your phone number';
                                                    } else if (value.length !=
                                                        11) {
                                                      return 'enter 11 number ';
                                                    }
                                                  },
                                                  controller: _phoneController,
                                                  keyboardType:
                                                      TextInputType.phone,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 50.0,
                                              ),
                                              Row(
                                                children: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text('Cancel'),
                                                  ),
                                                  Spacer(),
                                                  TextButton(
                                                    onPressed: () async {
                                                      if (_formKey.currentState!
                                                          .validate()) {
                                                        /*update name on server and local provider */
                                                        Navigator.pop(context);
                                                      }

                                                      // Capture a photo
                                                    },
                                                    child: const Text('OK'),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              icon: Icon(
                                Icons.edit,
                                size: 20.0,
                                color: Colors.grey,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 50.0, left: 50.0),
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
