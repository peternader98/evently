import 'package:flutter/material.dart';

class EventlyTextfield extends StatefulWidget {
  EventlyTextfield({
    required this.hint,
    this.password = false,
    this.email = false,
    required this.validation,
    required this.prefixIcon,
    required this.controller,
    super.key,
  });

  final String hint;
  late bool email;
  late bool password;
  String validation;
  String prefixIcon;
  TextEditingController controller;

  @override
  State<EventlyTextfield> createState() => _EventlyTextfieldState();
}

class _EventlyTextfieldState extends State<EventlyTextfield> {
  late bool secure = widget.password;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
      cursorColor: Theme.of(context).colorScheme.primary,
      obscureText: secure,
      controller: widget.controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.validation;
        }
        if (widget.password) {
          // Add more specific password validation (e.g., regex)
          if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)) {
            return widget.validation;
          }
        }
        if (widget.email) {
          // Add more specific email validation (e.g., regex)
          if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
          ).hasMatch(value)) {
            return widget.validation;
          }
        }
        if(!widget.password && !widget.email){
          if(value.length < 3){
            return widget.validation;
          }
        }
        return null;
      },
      decoration: InputDecoration(
        fillColor: Theme.of(context).colorScheme.onPrimary,
        filled: true,
        hintText: widget.hint,
        hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondary, fontSize: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.onPrimary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.onPrimary),
        ),
        contentPadding: EdgeInsets.all(16),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(width: 2, color: Theme.of(context).colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(width: 2, color: Theme.of(context).colorScheme.error),
        ),
        prefixIcon: widget.password
            ? ImageIcon(AssetImage('assets/images/${widget.prefixIcon}'))
        : ImageIcon(AssetImage('assets/images/${widget.prefixIcon}')),
        suffixIcon: widget.password
            ? secure
            ? IconButton(
          icon: Icon(
            secure ? Icons.visibility_off : Icons.visibility,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          onPressed: () => {
            setState(() {
              secure = !secure;
            }),
          },
        )
            : IconButton(
          icon: Icon(
            secure ? Icons.visibility_off : Icons.visibility,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          onPressed: () => {
            setState(() {
              secure = !secure;
            }),
          },
        )
            : null,
      ),
    );
  }
}
